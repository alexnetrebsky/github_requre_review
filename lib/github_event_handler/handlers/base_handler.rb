class BaseHandler
  class_attribute :events

  class << self
    def handle(event)
      raise ArgumentError, "Unsupported event #{event.class}, there are #{self.events}" unless self.events.include?(event.class)
      handler = self.new()
      handler.handle(event)
    end
  end

end