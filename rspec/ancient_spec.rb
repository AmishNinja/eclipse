require './ancient'

ancient_ship = Ancient.new("ship")
ancient_gdc = Ancient.new("gdc")

describe Ancient do 

	it "creates an ancient ship" do
		expect(ancient_ship.hp).to eq(2)
		expect(ancient_ship.hit_bonus).to eq(1)
		expect(ancient_ship.weapons.length).to eq(2)
	end

	it "creates a gdc" do
		expect(ancient_gdc.hp).to eq(8)
		expect(ancient_gdc.hit_bonus).to eq(1)
		expect(ancient_gdc.weapons.length).to eq(4)
	end

end