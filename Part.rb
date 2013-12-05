class Part
	attr_accessor :ship, :name

	def initialize ship, name
		self.ship = ship
		self.name = name
		sync_attrs
	end

	def sync_attrs
		case @name
		when "hull"
			self.ship.hp += 1
		when "improved hull"
			self.ship.hp += 2
		when "shard hull"
			self.ship.hp += 3
		when "gauss shield"
			self.ship.shield += 1
		when "phase shield"
			self.ship.shield += 2
		when "flux shield"
			self.ship.shield += 3
		when "electron computer"
			self.ship.hit_bonus += 1
		when "positron computer"
			self.ship.hit_bonus += 2
			self.ship.init += 1
		when "gluon computer"
			self.ship.hit_bonus += 3
			self.ship.init += 2
		when "nuclear drive"
			self.ship.init += 1
		when "fusion drive"
			self.ship.init += 2
		when "tachyon drive"
			self.ship.init += 3
		when "conformal drive"
			self.ship.init += 2
		end
		return self
	end

end