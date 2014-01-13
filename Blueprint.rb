require './Part.rb'
require './Weapon.rb'

class Blueprint
	attr_accessor :parts, :weapons, :type, :player

	def initialize(parts, weapons, type, player)
		self.parts, self.weapons = [], []
		self.type = type
		self.player = player
		apply_parts(parts)
		apply_weapons(weapons)
	end

	def apply_weapons(weapons)
		weapons.each do |weapon_name, amount|
			(1..amount).each do |n|
				self.weapons << Weapon.new(weapon_name)
			end
		end
	end

	def apply_parts(parts)
		parts.each do |part_name, amount|
			(1..amount).each do |n|
				self.parts << Part.new(part_name)				
			end
		end
	end

	def init
		return iterate_parts("init") + civ_init_bonus
	end

	def hp
		return iterate_parts "hp" + 1
	end

	def shield
		return iterate_parts "shield"
	end

	def hit_bonus
		return iterate_parts("hit_bonus") + civ_hit_bonus
	end

	def iterate_parts att
		@total = 0
		self.parts.each do |part|
			@val = part.instance_variable_get("@#{att}")
			if @val != nil && @val > 0
					@total += @val
			end
		end
		return @total
	end

	def civ_init_bonus
		@civ = self.player.civilization
		case self.type

		when "interceptor"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(@civ)
				return 2
			elsif @civ == "hegemony"
				return 3
			end 

		when "cruiser"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(@civ)
				return 1
			elsif @civ == "hegemony"
				return 2
			end
	
		when "dreadnaught"
			if @civ == "hegemony"
				return 1
			end

		when "starbase"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(@civ)
				return 4
			elsif @civ == "hegemony"
				return 5
			elsif @civ == "planta"
				return 2
			end

		end
		return 0
	end

	def civ_hit_bonus
		if self.player.civilization == "planta"
			return 1
		end
		return 0
	end
end