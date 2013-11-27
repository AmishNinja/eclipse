require './ship'
require './shiplist'

class Player
	attr_accessor :id, :civilization, :ships, :is_attacker

	def initialize(id=1, civilization="terran")
		self.id = id
		self.civilization = civilization
		self.ships = []
		self.is_attacker = false
	end

	def add_ships(ships)
		ships.each do |ship|
			new_ship = ship.dup
			new_ship.apply_civilization_template(self.civilization)
			new_ship.belongs_to = self.id
			self.ships << new_ship
		end
	end

	#combat initiation function. oh snap, it's on!
	def attack(player)
		self.is_attacker = true
		# todo build initiative queue, i.e. linked list of ships
		# process:
		# 	find all ships with missiles in initiative order
		# => fire missiles at first available targets of opposing player
		# => resolve damage, remove destroyed ships from LL
		# => begin at head of LL, fire at smallest enemy ship, resolve damage
		# => after each ship destruction, check if victim has any remaining ships
		# 			if not, resolve combat
		# 			other, continue with next ship in queue

	end

	

end