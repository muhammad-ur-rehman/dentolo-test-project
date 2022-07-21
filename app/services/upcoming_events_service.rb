class UpcomingEventsService
  def self.call
    new.call
  end

  def initialize
    @events = []
  end

  def call
    @events = BerghainEventsService.call
    @events += BerlinEventsService.call
    save_events
  end

  def save_events
    @events.map do |event|
      Event.find_or_create(event)
    end
  end

  private

  attr_accessor :events
end
