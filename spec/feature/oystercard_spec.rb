require 'oystercard'

# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in

describe 'User stories' do
  it 'knows the name of the station' do
    station = Station.new("Finsbury Park", 2)
    expect(station.name).to eq "Finsbury Park"
  end

  it 'knows what zone a station is in' do
    station = Station.new("Finsbury Park", 2)
    expect(station.zone).to eq 2
  end

# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out

  it 'deducts a penalty charge if user fails to touch in or out' do
    oystercard = OysterCard.new
    oystercard.top_up(30)
    oystercard.touch_in("Finsbury Park")
    #oystercard.touch_in("")
    expect{oystercard.touch_in("")}.to change {oystercard.balance}.by -OysterCard::PENALTY_CHARGE
  end

end