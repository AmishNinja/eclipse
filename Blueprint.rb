require './Part.rb'
require './Weapon.rb'

class Blueprint
	attr_accessor :parts, :weapons, :type

	def initialize(parts, weapons, type)
		self.parts, self.weapons = [], []
		self.type = type
		apply_parts(parts)
		apply_weapons(weapons)
	end

	def apply_weapons(weapons)
		weapons.each do |weapon_name, amount|
			(1..amount).each do |n|
				self.weapons << Weapon.new(weapon_name)
			end
		end
	end

	def apply_parts(parts)
		parts.each do |part_name, amount|
			(1..amount).each do |n|
				self.parts << Part.new(part_name)				
			end
		end
	end

end