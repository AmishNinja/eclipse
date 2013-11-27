require './player'

player1 = Player.new("1", "terran") # player one is a terran
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

ship_list = ShipList.new(all_ships)

describe ShipList do

	it "reports ship class and player in the correct order" do
		expect(ship_list.report).to eq("player1:interceptor->player1:cruiser->player2:interceptor->player2:cruiser")
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
		expect(copy.report).to eq("player1:cruiser->player2:interceptor")
	end

  it "properly arranges the initiative queue given a collection of ships belonging to both players" do
  end

end