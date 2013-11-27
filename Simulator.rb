require './Player.rb'
require './Ship.rb'

@player1 = Player.new("1", "terran")
@player2 = Player.new("2", "planta")
@ship1 = Ship.new(
		{"ion cannon" => 1, "plasma cannon" => 1},
		{"improved hull" => 1, "nuclear drive" => 1},
		"interceptor"
)
@ship2 = Ship.new(
		{"plasma cannon" => 2},
		{"improved hull" => 2, "hull" => 1},
		"cruiser"
	) 
@ships = [@ship1, @ship2]

@player1.add_ships(@ships)
@player2.add_ships(@ships)

@all_ships = []
@player1.ships.each do |ship|
	@all_ships << ship
end

@player2.ships.each do |ship|
	@all_ships << ship
end

def buildInitiativeQueue(all_ships)
	@list = ShipList.new(all_ships)	
end

