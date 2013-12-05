require './Part.rb'
require './Weapon.rb'
require './Entity.rb'

class Ship < Entity

	def apply_civilization_template(civilization)
		case @type

		when "interceptor"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(civilization)
				@init += 2
			elsif civilization == "hegemony"
				@init += 3
			elsif civilization == "planta"
				@hit_bonus += 1
			end
		
		
		when "cruiser"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(civilization)
				@init += 1
			elsif civilization == "hegemony"
				@init += 2
			elsif civilization == "planta"
				@hit_bonus += 1
			end
		
		
		when "dreadnaught"
			if civilization == "hegemony"
				@init += 1
			elsif civilization == "planta"
				@hit_bonus += 1
			end
		
		
		when "starbase"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(civilization)
				@init += 4
			elsif civilization == "hegemony"
				@init += 5
			elsif civilization == "planta"
				@hit_bonus += 1
				@init += 2
			end
		end
	end

end