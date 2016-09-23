require 'github/github_client'
require 'github_event_handler/events/issue_comment_event'
require 'github_event_handler/handlers/base_handler'

class RequireReviewerHandler < BaseHandler
  THUMBS_UP_SIGN_CODE = 128077

  self.events = [IssueCommentEvent]

  def handle(event)
    pull_request_number = event.pull_request_number
    repository_full_name = event.repository_full_name

    client = GithubClient.new

    last_commit = (client.pull_request_commits repository_full_name, pull_request_number).last
    sha_of_last_commit = last_commit[:sha.to_s]
    comments = client.issue_comments repository_full_name, pull_request_number

    number_approves = comments.select { |comment| comment[:body.to_s].unpack('U*').include?(THUMBS_UP_SIGN_CODE) }.count

    new_state = number_approves > 0 ? 'success' : 'failure'

    client.create_status repository_full_name, sha_of_last_commit, new_state, context: 'review'
  end
end