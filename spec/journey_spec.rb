
require 'journey'
require 'oystercard'

describe Journey do
  subject(:journey) {described_class.new}
  #let(:journey) {double(:journey, :entry_station => "Finsbury Park", :exit_station => nil)}
  #let(:oystercard2) {double(:oystercard, :entry_station => "Finsbury Park", :exit_station => "Acton Town")}

  let(:station) {double(:station)}

  it 'creates a journey hash with and entry station key' do
    journey = Journey.new("Finsbury Park", nil)
    expect(journey.create).to eq ({"Finsbury Park" => nil})
  end

  it 'updates the journey hash with an exit station value' do
    journey = Journey.new("Finsbury Park", "Acton Town")
    expect(journey.complete).to eq ({"Finsbury Park" => "Acton Town"})
  end

  describe '#fare' do
    it 'calculates the fare (either minimum fare or penalty)' do
      journey = Journey.new("Finsbury Park", "Acton Town")
      expect(journey.fare).to eq OysterCard::MIN_FARE
    end

    it 'calculates the fare for two back-to-back touch-ins' do
      journey = Journey.new("Acton Town", nil)
      journey.create
      journey[:in_journey] = true
      journey.create
      expect(journey.fare).to eq OysterCard::PENALTY_CHARGE
    end

    it 'calculates the fare for a touch-out not preceded by a touch-in' do
      journey = Journey.new(nil, "Acton Town")
      journey.complete
      expect(journey.fare).to eq OysterCard::PENALTY_CHARGE
    end
  end
end