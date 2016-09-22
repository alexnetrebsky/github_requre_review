class BaseEvent
  @json =

  class << self
    def try_parse(headers, json)
      if try_parse_internal(headers, json)
        self.new(json)
      end
    end

    def try_parse_internal(headers, json)
      raise NotImplementedError, 'Should be implemented in derived classes'
    end
  end

  def initialize(payload)
    @payload = payload
  end

  def pull_request_number
    issue = payload.fetch(:issue.to_s) { :no_issue }
    issue.fetch(:number.to_s) { :no_issue_number }
  end

  def repository_full_name
    repository = payload.fetch(:repository.to_s) { :no_repository }
    repository.fetch(:full_name.to_s) { :no_repository_full_name }
  end
end