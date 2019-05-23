# Stores all journey details
class Journey
  MINIMUM_FARE = 1
  PENALTY = 6
  attr_reader :entry_station, :exit_station

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def complete?
    !@entry_station.nil? && !@exit_station.nil?
  end

  def new?
    @entry_station.nil? && @exit_station.nil?
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY
  end
end
