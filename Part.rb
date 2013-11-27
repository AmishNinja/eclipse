class Part
	attr_accessor :name, :hp, :init, :hit_bonus, :shield


	def initialize(name)
		self.get_part(name)
	end

	def get_part(name)
		case name
		when "hull"
			self.hp = 1
			return self
		when "improved hull"
			self.hp = 2
			return self
		when "shard hull"
			self.hp = 3
			return self
		end
	end

end