require 'github_event_handler/events/base_event'

class PullRequestEvent < BaseEvent
  class << self
    def try_parse_internal(headers, json)
      return headers['X-GitHub-Event'] == 'pull_request'
    end
  end

  def repository_full_name
    repository = @payload.fetch(:repository.to_s) { :no_repository }
    repository.fetch(:full_name.to_s) { :no_repository_full_name }
  end

  def pull_request
    @payload.fetch(:pull_request.to_s) { :no_pull_request }
  end
end