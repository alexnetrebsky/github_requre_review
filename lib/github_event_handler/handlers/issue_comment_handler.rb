require 'octokit'
require 'json'

class IssueCommentHandler
  THUMBS_UP_SIGN_CODE = 128077

  def can_perform (request)
    request.headers['X-GitHub-Event'] == 'issue_comment'
  end

  def perform (request)
    payload = JSON.parse(request.body.read)
    issue = payload[:issue.to_s]
    pull_request_number = issue[:number.to_s]

    repository = payload[:repository.to_s]
    repository_full_name = repository[:full_name.to_s]

    client = Octokit::Client.new access_token:''

    last_commit = (client.pull_request_commits repository_full_name, pull_request_number).last
    sha_of_last_commit = last_commit[:sha.to_s]

    comments = client.issue_comments repository_full_name, pull_request_number

    number_approves = comments.select{|comment| comment[:body.to_s].unpack('U*').include?(THUMBS_UP_SIGN_CODE)}.count

    new_state = number_approves > 0 ? 'success' : 'failure'

    client.create_status repository_full_name, sha_of_last_commit, new_state, context: 'review'
  end
end