class Part
	attr_accessor :name, :hp, :init, :hit_bonus, :shield

	def initialize(name)
		self.get_part(name)
	end

	def get_part(name)
		case name
		when "hull"
			self.hp = 1
		when "improved hull"
			self.hp = 2
		when "shard hull"
			self.hp = 3
		when "gauss shield"
			self.shield = 1
		when "phase shield"
			self.shield = 2
		when "flux shield"
			self.shield = 3
		when "electron computer"
			self.hit_bonus = 1
		when "positron computer"
			self.hit_bonus = 2
			self.init = 1
		when "gluon computer"
			self.hit_bonus = 3
			self.init = 2
		when "nuclear drive"
			self.init = 1
		when "fusion drive"
			self.init = 2
		when "tachyon drive"
			self.init = 3
		when "conformal drive"
			self.init = 2
		end
		return self
	end

end