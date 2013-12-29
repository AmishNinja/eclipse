require './Entity.rb'

class Ancient < Entity

	def initialize(type)
		self.weapons = []
		self.hit_bonus = 1
		self.belongs_to = 'ancient'
		self.shield = 0
		self.type = type
		self.is_attacker = false
		if type == "ship"
			self.hp = 2
			self.init = 2
			apply_weapons({"plasma cannon" => 2})
		elsif type == "gdc"
			self.hp = 8
			self.init = 0
			apply_weapons({"plasma cannon" => 4})
		end
	end

end