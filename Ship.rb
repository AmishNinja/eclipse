require './Part.rb'
require './Weapon.rb'
require './Entity.rb'

class Ship < Entity

	def initialize (blueprint, belongs_to)
		@hp, @init, @hit_bonus, @shield = 1, 0, 0, 0
		self.blueprint = blueprint
		self.belongs_to = belongs_to
	end

	def apply_blueprint
		self.blueprint.parts.each do |part|
			part.apply self
		end
	end

	def is_attacker?
		return self.belongs_to.is_attacker
	end

	def weapons
		return self.blueprint.weapons
	end

	def type
		return self.blueprint.type
	end

	

end