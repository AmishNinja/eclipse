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
		end
		return self
	end

end