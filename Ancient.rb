require 'Weapon'

class Ancient < Entity

	def initialize(type)
		if type == "ship"
			self.hp = 2
			self.hit_bonus = 1
			self.weapons = self.build_weapons(['plasma cannon'] => 2)
		elsif type == "GDC"
			self.hp = 8
			self.hit_bonus = 1
			self.weapons = self.build_weapons(['plasma cannon'] => 4)
		end

	end
end