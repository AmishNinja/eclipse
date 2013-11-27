require './player'

player1 = Player.new("1", "terran") # player one is a terran
player2 = Player.new("2", "planta")

ships = [
					Ship.new({"ion cannon" => 1, "plasma cannon" => 1},{"improved hull" => 1, "nuclear drive" => 1},"interceptor"),
					Ship.new({"plasma cannon" => 2},{"improved hull" => 2, "hull" => 1},"cruiser")
]

describe Player do
	it "assigns an array of ships to the player's control" do
		player1.add_ships(ships)
		expect(player1.ships.length).to eq(2)
	end

	it "properly assigns attributes to all ships based on player civilization, ship class, and its parts" do
			player2.add_ships(ships)
			expect(player2.ships[0].init).to eq (0)
			expect(player2.ships[0].hit_bonus).to eq(1)
			expect(player2.ships[0].hp).to eq(3)
			expect(player2.ships[0].weapons.length).to eq(2)
	end

	it "has ships that roll for attack! hah!" do
		expect(player2.ships[0].roll_attacks.length).to eq(2)
	end

end