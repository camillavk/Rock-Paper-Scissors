require_relative '../app/spock'

describe Spock do

	let(:spock) {Spock.new}

	it "should have a name" do
		expect(spock.name).to eq("Spock")
	end

	it "should beat scissors" do
		expect(spock.beat_scissors).to be true
	end

	it "should beat rock" do
		expect(spock.beat_rock).to be true
	end

	it "shouldn't beat lizard" do
		expect(spock.beat_lizard).to be false
	end

	it "shouldn't beat paper" do
		expect(spock.beat_paper).to be false
	end

end