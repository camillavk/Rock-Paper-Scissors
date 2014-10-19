require_relative '../app/scissors'

describe Scissors do 

	let(:scissors) {Scissors.new}

	it "should have a name" do
		expect(scissors.name).to eq("Scissors")
	end

	it "should beat paper" do
		expect(scissors.beat_paper).to be true
	end

	it "should beat lizard" do
		expect(scissors.beat_lizard).to be true
	end

	it "shouldn't beat rock" do
		expect(scissors.beat_rock).to be false
	end

	it "shouldn't beat spock" do
		expect(scissors.beat_spock).to be false
	end
	
end