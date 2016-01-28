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
end