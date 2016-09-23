require 'github_event_handler/handlers/base_handler'
require 'github_event_handler/handlers/pull_request_testers/approve_existence_tester'
require 'github_event_handler/handlers/pull_request_testers/title_tester'
require 'github_event_handler/events/pull_request_event'
require 'github_event_handler/events/issue_comment_event'
require 'github/github_client'

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

    error_message = nil
    @testers.find do |tester|
      error_message = tester.test(pull_request, client)
      error_message
    end

    new_state = error_message ? :failure : :success

    client.create_status repository_full_name, pull_request_head_sha, new_state, context: 'review', description: error_message
  end

  private

  def get_pull_request(repository_full_name, pull_request_number, client)
    client.pull_request repository_full_name, pull_request_number
  end
end