require './entity'

class Ancient < Entity

	def initialize(type)
		self.weapons = []
		self.hit_bonus = 1
		self.belongs_to = 3
		if type == "ship"
			self.hp = 2
			self.build_weapons({"plasma cannon" => 2})
		elsif type == "gdc"
			self.hp = 8
			self.build_weapons({"plasma cannon" => 4})
		end
	end
	
end