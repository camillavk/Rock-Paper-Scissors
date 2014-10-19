require_relative '../app/paper'

describe Paper do 

	let(:paper) {Paper.new}

	it "should have a name" do
		expect(paper.name).to eq("Paper")
	end

	it "should beat rock" do
		expect(paper.beat_rock).to be true
	end

	it "should beat spock" do
		expect(paper.beat_spock).to be true
	end

	it "shouldn't beat scissors" do
		expect(paper.beat_scissors).to be false
	end
	
	it "shouldn't beat lizard" do
		expect(paper.beat_lizard).to be false
	end

end