require 'github_event_handler/handlers/pull_request_status_handler'
require 'hash_helper_decorator'

class GithubEventHandler
  def initialize
    @handlers = [PullRequestStatusHandler]
  end

  def handle (request)
    payload = JSON.parse(request.body.read)
    payload = HashHelperDecorator.new(payload, -> { raise StandardError.new('key undefined') })
    unless repository_registered?(payload)
      puts "WOW"
      return false
    end

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

  def repository_registered?(payload)
    payload.to_hash_helper

    repository_full_name = payload.get_by_path('repository/full_name')
    puts "full name #{repository_full_name}"
    GithubRepository.exists?(full_name: repository_full_name)
  end
end
