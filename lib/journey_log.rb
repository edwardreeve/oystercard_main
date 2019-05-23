# Stores a history of all journeys etc
class JourneyLog
  attr_reader :journey
  def initialize(journey = Journey.new)
    @journey = journey
  end

  def start(station)
    @journey.start(station)
  end

  def current_journey
    unless @journey.complete? 
      @journey
    end
  end
end
