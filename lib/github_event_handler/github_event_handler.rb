require 'github_event_handler/handlers/pull_request_status_handler'

class GithubEventHandler
  def initialize
    @handlers = [PullRequestStatusHandler]
  end

  def handle (request)
    payload = JSON.parse(request.body.read)

    expected_events = @handlers.flat_map { |handler| handler.events }.compact
    event = expected_events
                .map { |item| item.try_parse(request.headers, payload) }
                .find { |item| item.present? }

    return false if event.nil?

    @handlers
        .select { |handler|
      handler.events.include?(event.class)
    }
        .each { |handler|
      handler.handle(event)
    }

    return true
  end
end
