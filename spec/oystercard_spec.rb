require 'oystercard'

  describe OysterCard do 

	subject(:card) { described_class.new }	
  
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it { is_expected.to respond_to(:deduct).with(1).argument }

		it 'displays a balance of zero when card is new' do 
		expect(card.balance).to eq 0

		end


	describe '#top_up' do 

    
		it 'allows user to top up' do
		card.top_up(5)
		expect(card.balance).to eq 5 

		end
    
    it 'does not allow negative amounts' do 
    expect { card.top_up(-2) }.to raise_error "Does not accept negative amounts"
      
    end
    
    it 'has a £90 limit on top ups' do
      balance_limit = OysterCard::MAXIMUM_AMOUNT
      card.top_up(balance_limit)
      expect { card.top_up(1) }.to raise_error "You have reached £90"
    end

	end
  
  describe '#deduct' do
    
    it 'deducts a fare from the card' do
      card.top_up 50
      expect{ card.deduct 21}.to change{ card.balance }.by -21
    end
    
  end
	
  end




