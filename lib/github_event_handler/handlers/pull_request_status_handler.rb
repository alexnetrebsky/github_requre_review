require 'github_event_handler/handlers/base_handler'
require 'github_event_handler/handlers/pull_request_testers/approve_existence_tester'
require 'github_event_handler/handlers/pull_request_testers/title_tester'
require 'github_event_handler/events/pull_request_event'
require 'github_event_handler/events/issue_comment_event'
require 'github/github_client'
require 'url_builder'

class PullRequestStatusHandler < BaseHandler
  self.events = [PullRequestEvent, IssueCommentEvent]

  def initialize
    @testers = [PullRequestTesters::ApproveExistenceTester.new, PullRequestTesters::TitleTester.new]
  end


  def handle(event)
    repository_full_name = event.repository_full_name
    client = GithubClient.new
    pull_request = event.respond_to?(:pull_request) ? event.pull_request : get_pull_request(repository_full_name, event.pull_request_number, client)
    pull_request_head_sha = pull_request['head']['sha']
    pull_request_number = pull_request['number']
    branch_name = pull_request['head']['ref']

    test_results = {}
    @testers.each do |tester|
      error_message = tester.test(pull_request, client)
      test_key = tester.class.name
      test_results[test_key] = error_message
    end

    error_result = test_results.find { |key, error_message| error_message.present? }
    new_state = error_result.present? ? :failure : :success

    error_message = Array(error_result)[1]
    test_result = save_result(new_state, test_results, repository_full_name, branch_name, pull_request_number)
    url_builder = UrlBuilder.new

    client.create_status repository_full_name,
                         pull_request_head_sha,
                         new_state,
                         context: 'review',
                         description: error_message,
                         target_url: url_builder.test_result_url(test_result.id)
  end

  private

  def save_result(status, test_result_items, repository_full_name, branch_name, pull_request_number)
    github_repository = GithubRepository.find_or_create_by(full_name: repository_full_name)
    github_branch = GithubBranch.find_or_create_by(github_repository_id: github_repository.id, name: branch_name)
    test_result = TestResult.create({
                                        github_branch: github_branch,
                                        status: status,
                                        gihub_pull_request: pull_request_number
                                    })
    test_result_items.each do |key, error_message|
      TestResultItem.create({
                                test_result: test_result,
                                key: key,
                                description: error_message,
                                status: error_message.present? ? :failure : :success
                            })
    end
    return test_result
  end

  def get_pull_request(repository_full_name, pull_request_number, client)
    client.pull_request repository_full_name, pull_request_number
  end
end