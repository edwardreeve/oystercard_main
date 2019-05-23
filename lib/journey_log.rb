# Stores a history of all journeys etc
class JourneyLog
  attr_reader :journeys

  def initialize(journey = Journey.new)
    @journeys = [journey]
  end

  def start(station)
    @journeys.last.start(station)
  end

  def finish(station)
    @journeys.last.finish(station)
  end

  def current_journey(journey = Journey.new)
    @journeys.last.complete? ? @journeys << journey : @journeys.last
  end
end
