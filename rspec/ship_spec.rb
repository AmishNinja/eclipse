require './Ship.rb'

ship = Ship.new({"ion cannon" => 1, "plasma cannon" => 1},{"improved hull" => 1, "nuclear drive" => 1, "gauss shield" => 1, "electron computer" => 1},"interceptor")
ship2 = Ship.new({"ion cannon" => 1, "plasma cannon" => 1},{"improved hull" => 1, "nuclear drive" => 1, "phase shield" => 1},"interceptor")
ancient = Ancient.new("ship")

describe Ship do 

	it "rolls for attack" do
		rolls = ship.roll
		expect(rolls.length).to eq(2)
		rolls.each do |roll|
			expect(roll.has_key?("raw")).to eq(true)
			expect(roll.has_key?("damage")).to eq(true)
		end
	end

	it "attacks ancients" do
		damage = ship.attack(ancient)
		max_damage = 0
		ship.weapons.each do |weapon|
			max_damage += weapon.damage
		end
		expect(damage).to be_between(0, max_damage)
	end

	it "destroys ancients" do
		while ancient.destroyed? == false
			ship.attack(ancient)
		end
		expect(ancient.destroyed?).to eq(true)
	end

end