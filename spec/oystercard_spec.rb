require 'oystercard'

describe OysterCard do
  subject(:card) { OysterCard.new }
  
  describe '#add' do
    it 'responds to #add with one argument' do
      expect(card).to respond_to(:add).with(1).argument
    end
  end

  describe '#balance' do
    it 'returns a balance' do
      expect(card.balance).to eq 0
    end
  end
end
