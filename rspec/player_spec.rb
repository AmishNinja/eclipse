require './player'

player1 = Player.new("1", "terran") # player one is terran
player2 = Player.new("2", "planta") # player two is planta

ships = [
					Ship.new({"ion cannon" => 1, "plasma cannon" => 1},{"improved hull" => 1, "nuclear drive" => 1, "gauss shield" => 1},"interceptor"),
					Ship.new({"plasma cannon" => 2},{"improved hull" => 2, "hull" => 1},"cruiser")
]

describe Player do
	it "creates a player with expected attributes" do
		expect(player1.id).to eq('1')
		expect(player1.civilization).to eq("terran")
		expect(player1.ships).to eq([])
		expect(player1.is_attacker).to eq(false)
	end


	it "assigns an array of ships to the player's control" do
		player1.add_ships(ships)
		expect(player1.ships.length).to eq(2)
	end

	it "properly assigns attributes to each ship based on player civilization, ship class, and its parts" do
		player2.add_ships(ships)
		ship = player2.ships.first
		expect(ship.init).to eq (1)
		expect(ship.hit_bonus).to eq(1)
		expect(ship.hp).to eq(3)
		expect(ship.shield).to eq (1)
		expect(ship.weapons.length).to eq(2)
		expect(ship.weapons.first.damage).to eq(1)
		expect(ship.weapons.last.damage).to eq(2)
		ship.weapons.each { |weapon| expect(weapon.attacks).to eq(1) }
		expect(ship.type).to eq("interceptor")
	end

	it "has ships that roll for attack! hah!" do
		expect(player2.ships.first.roll_attacks.length).to eq(2)
	end


	

end