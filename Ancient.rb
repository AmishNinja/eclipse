require './entity'

class Ancient < Entity

	def initialize(type)
		self.weapons = []
		@hit_bonus = 1
		@belongs_to = 'ancient'
		@shield = 0
		@type = type
		@is_attacker = false
		if type == "ship"
			@hp = 2
			@init = 2
			self.apply_weapons({"plasma cannon" => 2})
		elsif type == "gdc"
			@hp = 8
			@init = 0
			self.apply_weapons({"plasma cannon" => 4})
		end
	end

end