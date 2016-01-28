

require 'station'

class OysterCard

 attr_reader :balance, :entry_station, :history

 MAX_AMOUNT = 90
 MIN_AMOUNT = 1
 MIN_FARE = 2

	def initialize
		@balance = 0
    @history = [] 
	end
  
  def in_journey?
    !!@entry_station
  end

	def top_up(amount)
    fail "Does not accept negative amounts" if amount < 0
    fail "You have reached £#{MAX_AMOUNT}" if balance + amount > MAX_AMOUNT
		@balance += amount	
	end
	
  
  def touch_in(entry_station)
    fail "Insufficient balance - Minimum required: £#{MIN_AMOUNT}" if balance < MIN_AMOUNT
    self.entry_station = entry_station
  end
  
  def touch_out(exit_station)
    deduct(MIN_FARE)
    log_journey(exit_station)
    self.entry_station = nil
  end
    
  private
  
  attr_writer :balance, :entry_station, :history
  
  def log_journey(exit_station)
    hash = {}
    hash[self.entry_station] = exit_station 
    self.history << hash
  end

  def deduct(amount)
    self.balance -= amount
  end


end