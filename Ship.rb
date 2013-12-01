require './Part.rb'
require './Weapon.rb'
require './Entity.rb'

class Ship < Entity

	def apply_civilization_template(civilization)
		case self.type

		when "interceptor"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(civilization)
				self.init += 2
			elsif civilization == "hegemony"
				self.init += 3
			elsif civilization == "planta"
				self.hit_bonus += 1
			end
		
		
		when "cruiser"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(civilization)
				self.init += 1
			elsif civilization == "hegemony"
				self.init += 2
			elsif civilization == "planta"
				self.hit_bonus += 1
			end
		
		
		when "dreadnaught"
			if civilization == "hegemony"
				self.init += 1
			elsif civilization == "planta"
				self.hit_bonus += 1
			end
		
		
		when "starbase"
			if ["terran", "hydran", "descendents", "mechanema", "eridani"].include?(civilization)
				self.init += 4
			elsif civilization == "hegemony"
				self.init += 5
			elsif civilization == "planta"
				self.hit_bonus += 1
				self.init += 2
			end
		end
	end

end