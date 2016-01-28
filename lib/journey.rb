require_relative 'oystercard'

class Journey < Struct.new(:entry_station, :exit_station, :in_journey)
  
  attr_accessor :penalty

  def create
    in_journey ? @penalty = true : @penalty = false
    journey = {}
    journey[entry_station] = exit_station
    #@in_journey = true
    journey
  end

  def complete
    in_journey ? @penalty = false : @penalty = true
    journey = {}
    journey[entry_station] = exit_station
    self.entry_station = nil
    #@in_journey = false
    journey
  end

  def fare
    penalty ? OysterCard::PENALTY_CHARGE : OysterCard::MIN_FARE
  end
end