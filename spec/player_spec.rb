require_relative '../app/player'

describe Player do 

	it "should have a name" do
		player = Player.new("Camilla")
		expect(player.name).to eq "Camilla"
	end

end