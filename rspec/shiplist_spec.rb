require './player'

player1 = Player.new("1", "terran", true) # player one is a terran
player2 = Player.new("2", "planta") # player two is a planta

ships = [
					Ship.new({"ion cannon" => 1, "plasma cannon" => 1},{"improved hull" => 1, "nuclear drive" => 1},"interceptor"),
					Ship.new({"plasma cannon" => 2},{"improved hull" => 2, "hull" => 1},"cruiser")
]

player1.add_ships(ships)
player2.add_ships(ships)

all_ships = []
player1.ships.each do |ship|
	all_ships << ship
end

player2.ships.each do |ship|
	all_ships << ship
end

all_ships_copy = all_ships.dup
ship_list = ShipList.new(all_ships_copy)

describe ShipList do

	it "reports ship class and player in the correct order" do
		expect(ship_list.report).to eq("player 1 interceptor->player 1 cruiser->player 2 interceptor->player 2 cruiser")
	end

	it "correctly accounts for the number of ships in the list before and after removing ships" do
		copy = ship_list.dup
		expect(copy.length).to eq(4)
		copy.delete(player1.ships[0])
		copy.delete(player2.ships[1])
		expect(copy.length).to eq(2)
	end		
	
	it "reports ship class and player in the correct order after deleting ships" do
		copy = ship_list.dup
		copy.delete(player1.ships[0])
		copy.delete(player2.ships[1])
		expect(copy.report).to eq("player 1 cruiser->player 2 interceptor")
	end

  it "properly arranges the initiative queue given a collection of player ships and ancients" do
    test_collection = []
    player1.ships.each { |ship| test_collection << ship }
    test_collection << Ancient.new("ship")
    test_collection << Ancient.new("ship")
    sorted = test_collection.sort.reverse!
    ship_list = ShipList.new(sorted)
    expect(ship_list.report).to eq("player 1 interceptor->ancient ship->ancient ship->player 1 cruiser")
  end

  it "properly arranges the initiative queue given a collection of ships belonging to both players" do
    all_ships[0].init = 2
    all_ships[1].init = 1
    all_ships[2].init = 1
    all_ships[3].init = 2
    sorted = all_ships.sort.reverse!
    ship_list = ShipList.new(sorted)
    expect(ship_list.report).to eq("player 2 cruiser->player 1 interceptor->player 2 interceptor->player 1 cruiser")
  end

end