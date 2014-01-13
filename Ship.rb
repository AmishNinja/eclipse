require './Part.rb'
require './Weapon.rb'
require './Entity.rb'

class Ship < Entity

	def initialize (blueprint, belongs_to, player)
		self.blueprint = blueprint
		self.belongs_to = belongs_to
		@player = player
	end

	def is_attacker?
		return self.player.is_attacker
	end

	def weapons
		return self.blueprint.weapons
	end

	def type
		return self.blueprint.type
	end

end