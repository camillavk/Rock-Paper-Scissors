require_relative '../app/lizard'

describe Lizard do

	let(:lizard) {Lizard.new}

	it "should have a name" do
		expect(lizard.name).to eq("Lizard")
	end

	it "should beat spock" do
		expect(lizard.beat_spock).to be true
	end

	it "should beat paper" do
		expect(lizard.beat_paper).to be true
	end

	it "shouldn't beat rock" do
		expect(lizard.beat_rock).to be false
	end

	it "shouldn't beat scissors" do
		expect(lizard.beat_scissors).to be false
	end

end