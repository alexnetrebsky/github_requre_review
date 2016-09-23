class BaseHandler
  class_attribute :events
  class_attribute :event_code

  self.events = :no_events #should be Array
  self.event_code = :no_event_code #should be symbol

  class << self
    def handle(event)
      raise ArgumentError, "Unsupported event #{event.class}, there are #{self.events}" unless self.events.include?(event.class)
      handler = self.new()
      handler.handle(event)
    end
  end

end