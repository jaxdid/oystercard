require 'station'

describe Station do
  subject(:station) {described_class.new("Finsbury Park", 2)}

  it 'knows the name of the station' do
    expect(station.name).to eq "Finsbury Park"
  end

  it 'knows what zone a station is in' do
    expect(station.zone).to eq 2
  end
end