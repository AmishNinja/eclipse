class Part
	attr_accessor :name

	def initialize ship, name
		self.name = name
		sync_attrs ship
	end

	def sync_attrs ship
		case @name
		when "hull"
			ship.hp += 1
		when "improved hull"
			ship.hp += 2
		when "shard hull"
			ship.hp += 3
		when "gauss shield"
			ship.shield += 1
		when "phase shield"
			ship.shield += 2
		when "flux shield"
			ship.shield += 3
		when "electron computer"
			ship.hit_bonus += 1
		when "positron computer"
			ship.hit_bonus += 2
			ship.init += 1
		when "gluon computer"
			ship.hit_bonus += 3
			ship.init += 2
		when "nuclear drive"
			ship.init += 1
		when "fusion drive"
			ship.init += 2
		when "tachyon drive"
			ship.init += 3
		when "conformal drive"
			ship.init += 2
		end
		return self
	end

end