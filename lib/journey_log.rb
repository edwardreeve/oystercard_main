# Stores a history of all journeys etc
class JourneyLog
  attr_reader :journeys

  def initialize(journey = Journey)
    @journeys = [journey.new]
    @journey = journey
  end

  def start(station)
    journey = @journey.new
    journey.start(station)
    @journeys << journey
  end

  def finish(station)
    current = current_journey
    current.finish(station)
    @journeys << current
  end

  private

  def current_journey
    @journeys.last.complete? ? @journey.new : @journeys.last
  end
end
