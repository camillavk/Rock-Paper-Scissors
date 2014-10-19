require_relative '../app/game'

describe Game do 

	let (:game) {Game.new}
	let (:player) {double :player}
	let (:opponent) {double :opponent}
	let (:rock) {double :rock}

	it "should have five choices" do
		expect(game.choices).to be_kind_of(Array)
	end

	it "can add a player" do
		game.add_player(player)
		expect(game.player1).to eq(player)
	end

	it "can have a second player" do
		game.add_player(player)
		game.add_player(opponent)
		expect(game.player2).to eq(opponent)
	end

	it "can add a choice" do
		game.add_choice(rock)
		expect(game.choices).to include(rock)
	end

end