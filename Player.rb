require './Ship.rb'
require './ShipList.rb'
require './Blueprint.rb'

class Player
	attr_accessor :id, :civilization, :ships, :is_attacker, :blueprints

	def initialize(id=1, civilization="terran", blueprints, is_attacker)
		@id = id
		@civilization = civilization
		@ships = []
		@blueprints = blueprints
		@is_attacker = is_attacker
	end

	def create_blueprints(blueprints)
		self.blueprints = {}
		blueprints.each do |type, hash|
			self.blueprints[type] = Blueprint.new hash[:parts], hash[:weapons], type, self
		end
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

end