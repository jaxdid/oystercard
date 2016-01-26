

class OysterCard

 attr_reader :balance

 MAXIMUM_AMOUNT = 90

	def initialize
		@balance = 0
    @in_journey = false
	end
  
  def in_journey?
    @in_journey
  end
  

	def top_up(amount)
    fail "Does not accept negative amounts" if amount < 0
    fail "You have reached £#{MAXIMUM_AMOUNT}" if updated_amount(amount) > MAXIMUM_AMOUNT
		@balance += amount	
	end
	
  def deduct(amount)
    @balance -= amount
  end
  
  def touch_in(location)
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