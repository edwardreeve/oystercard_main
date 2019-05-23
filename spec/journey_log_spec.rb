require 'journey_log'

describe JourneyLog do
  let(:station) { double('Station') }
  it { should be_an_instance_of(JourneyLog) }

  it 'should respond to start' do
    expect(subject).to respond_to(:start).with(1).argument
  end

  context 'Given that a journey is started' do
    before(:each) { subject.start(station) }
    it 'start should result in a journey with an entry station' do
      expect(subject.journey.entry_station).to eq(station)
    end

    it 'current journey should return journey if incomplete' do
      expect(subject.current_journey).to eq(subject.journey)
    end

    it 'current journey should create new journey if not' do
    end
  end
end
