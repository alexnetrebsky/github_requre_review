require 'github_event_handler/handlers/issue_comment_handler'

class GithubEventHandler
  def initialize
    @handlers = [RequireReviewerHandler]
  end

  def handle (request)
    payload = JSON.parse(request.body.read)

    expected_events = @handlers.flat_map { |handler| handler.events }.compact
    event = expected_events.find { |item| item.try_parse(request.headers, payload) }

    return false if event.nil?

    @handlers
        .select { |handler|
      handler.events.include?(event)
    }
        .each { |handler|
      handler.handle(event)
    }

    return handled
  end
end
