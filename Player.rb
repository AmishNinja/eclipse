require './Ship.rb'
require './ShipList.rb'
require './Blueprint.rb'

class Player
	attr_accessor :id, :civilization, :ships, :is_attacker, :blueprints

	def initialize(id=1, civilization="terran", blueprints, is_attacker)
		self.id = id
		self.civilization = civilization
		self.ships = []
		self.blueprints = create_blueprints(blueprints)
		self.is_attacker = is_attacker
	end

	def create_blueprints(blueprints)
		self.blueprints = {}
		blueprints.each do |type, hash|
			self.blueprints[type] = Blueprint.new hash[:parts], hash[:weapons], type
		end
		return self.blueprints
	end

	def add_ships (ships)
		ships.each do |type, amount|
			(1..amount).each do 
				self.add_ship(type)
			end
		end
	end

	def add_ship(type)
		ship = Ship.new(self.blueprints["#{type}"], self)
		ship.apply_blueprint
		self.apply_civilization_template(ship)
		self.ships << ship
	end

	def apply_civilization_template(ship)
		case ship.blueprint.type

		when "interceptor"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(@civilization)
				ship.init += 2
			elsif @civilization == "hegemony"
				ship.init += 3
			elsif @civilization == "planta"
				ship.hit_bonus += 1
			end
		
		when "cruiser"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(@civilization)
				ship.init += 1
			elsif @civilization == "hegemony"
				ship.init += 2
			elsif @civilization == "planta"
				ship.hit_bonus += 1
			end
		
		when "dreadnaught"
			if @civilization == "hegemony"
				ship.init += 1
			elsif @civilization == "planta"
				ship.hit_bonus += 1
			end
		
		
		when "starbase"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(@civilization)
				ship.init += 4
			elsif @civilization == "hegemony"
				ship.init += 5
			elsif @civilization == "planta"
				ship.hit_bonus += 1
				ship.init += 2
			end

		end
	end

end