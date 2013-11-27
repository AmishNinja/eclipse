class Weapon < Part
	attr_accessor :damage, :attacks, :first_strike

	def initialize(name)
		self.first_strike = false
		self.attacks = 1
		case name
		when "ion cannon"
			self.damage = 1
		when "ion turret"
			self.damage = 1
			self.attacks = 2
		when "plasma cannon"
			self.damage = 2
		when "antimatter cannon"
			self.damage = 4
		when "plasma missiles"
			self.damage = 2
			self.attacks = 2
			self.first_strike = true
		end
	end

end