require_relative '../app/rock'

describe Rock do 

	let(:rock) {Rock.new}

	it "should have a name" do
		expect(rock.name).to eq("Rock")
	end

	it "should beat scissors" do
		expect(rock.beat_scissors).to be true
	end

	it "should beat lizard" do
		expect(rock.beat_lizard).to be true
	end

	it "shouldn't beat paper" do
		expect(rock.beat_paper).to be false
	end

	it "shouldn't beat spock" do
		expect(rock.beat_spock).to be false
	end
	
end