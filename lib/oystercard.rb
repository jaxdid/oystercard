

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
    fail "You have reached £#{MAX_AMOUNT}" if updated_amount(amount) > MAX_AMOUNT
		@balance += amount	
	end
	
  
  def touch_in(location)
    fail "Insufficient balance - Minimum required: £#{MIN_AMOUNT}" if balance < MIN_AMOUNT
    self.entry_station = location
  end
  
  def touch_out(location)
    deduct(MIN_FARE)
    hash = {}
    hash[self.entry_station] = location 
    self.history << hash
    self.entry_station = nil
  end
    
  private
  
  attr_writer :balance, :entry_station, :history
  
  def updated_amount(amount)
    @balance + amount
  end
  
  def deduct(amount)
    self.balance -= amount
  end


end