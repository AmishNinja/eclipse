require './Player.rb'
require './Ship.rb'

@player1 = Player.new("1", "terran", true)
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

@all_ships[0].init = 2 #interceptor 1
@all_ships[1].init = 1 #cruiser 1
@all_ships[2].init = 1 #interceptor 2
@all_ships[3].init = 2 #cruiser 2

def buildInitiativeQueue(all_ships)
	 sorted = all_ships.sort.reverse!
   @list = ShipList.new(sorted)	
	 puts @list.report
 end

buildInitiativeQueue(@all_ships)
