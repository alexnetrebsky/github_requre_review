require 'github_event_handler/handlers/issue_comment_handler'

class GithubEventHandler
  def initialize
    @handlers = [IssueCommentHandler.new]
  end

  def perform (request)
    handler = @handlers.find { |item| item.can_perform(request) }
    handler.perform (request) if handler.present?
    return handler.present?
  end
end
