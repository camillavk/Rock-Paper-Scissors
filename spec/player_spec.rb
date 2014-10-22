require_relative '../app/player'

describe Player do 

	let(:player) {Player.new}
	let(:rock) {double :rock}

	it "should have a name" do
		player.name = "Camilla"
		expect(player.name).to eq "Camilla"
	end

	it "should be able to select a choice" do
		player.select(rock)
		expect(player.choice).to eq(rock)
	end

end