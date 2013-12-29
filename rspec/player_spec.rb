require './Player.rb'

loadout = Hash.new
loadout["interceptor"] = {:weapons => {"ion cannon" => 1, "plasma cannon" => 1}, :parts => {"improved hull" => 1, "nuclear drive" => 1, "gauss shield" => 1}}
loadout["cruiser"] = {:weapons => {"plasma cannon" => 2}, :parts => {"improved hull" => 2, "hull" => 1}}

player1 = Player.new("1", "terran", loadout, true) # player one is terran
player2 = Player.new("2", "planta", loadout, false) # player two is planta

describe Player do
	it "creates a player with expected attributes" do
		expect(player1.id).to eq('1')
		expect(player1.civilization).to eq("terran")
		expect(player1.ships).to eq([])
		expect(player1.is_attacker).to eq(true)
	end

	it "assigns an array of ships to the player's control" do
		player1.add_ships({"interceptor" => 2, "cruiser" => 1})
		expect(player1.ships.length).to eq(3)
	end

	it "properly assigns attributes to each ship based on player civilization, ship class, and its parts" do
		player2.add_ship("interceptor")
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
	
end