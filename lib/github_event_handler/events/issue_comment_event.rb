require 'github_event_handler/events/base_event'

class IssueCommentEvent < BaseEvent
  class << self
    def try_parse_internal(headers, json)
      return headers['X-GitHub-Event'] == 'issue_comment'
    end
  end

  def pull_request_number
    issue = @payload.fetch(:issue.to_s) { :no_issue }
    issue.fetch(:number.to_s) { :no_issue_number }
  end

  def repository_full_name
    repository = @payload.fetch(:repository.to_s) { :no_repository }
    repository.fetch(:full_name.to_s) { :no_repository_full_name }
  end
end