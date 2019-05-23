# A card to store funds and pay for travel
class Oystercard
  attr_reader :balance, :journey_list
  MAX_BALANCE = 90
  MIN_BALANCE = Journey::MINIMUM_FARE
  MAX_ERROR = "Cannot top-up beyond £#{MAX_BALANCE}".freeze
  MIN_ERROR = "Minimum fare of £#{MIN_BALANCE} is required to touch in".freeze

  def initialize(balance = 0, log = JourneyLog.new)
    @balance = balance
    @log = log
  end

  def min_balance_met?
    @balance >= MIN_BALANCE
  end

  def top_up(amount)
    raise MAX_ERROR if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def touch_in(station)
    raise MIN_ERROR unless min_balance_met?

    # charge unless @log.journeys.last.complete? || @log.journeys.last.new?
    @log.start(station)
  end

  def touch_out(station)
    @log.finish(station)
    charge
  end

  private

  def charge
    @balance -= @log.journeys.last.fare
  end
end
