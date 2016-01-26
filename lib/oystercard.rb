

class OysterCard

 attr_reader :balance

 MAX_AMOUNT = 90
 MIN_AMOUNT = 1

	def initialize
		@balance = 0
    @in_journey = false
	end
  
  def in_journey?
    @in_journey
  end
  

	def top_up(amount)
    fail "Does not accept negative amounts" if amount < 0
    fail "You have reached £#{MAX_AMOUNT}" if updated_amount(amount) > MAX_AMOUNT
		@balance += amount	
	end
	
  def deduct(amount)
    @balance -= amount
  end
  
  def touch_in(location)
    fail "Insufficient balance - Minimum required: £#{MIN_AMOUNT}" if balance < MIN_AMOUNT
    self.in_journey = true
  end
  
  def touch_out(location)
    self.in_journey = false
  end
    
  private
  
  attr_writer :in_journey
  
  def updated_amount(amount)
    @balance + amount
  end


end