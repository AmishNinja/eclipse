require './Part.rb'
require './Weapon.rb'

class Entity
	attr_accessor :hp, :init, :hit_bonus, :shield, :type, :weapons, :parts, :belongs_to

	def initialize(weapons, parts, type)
		self.hp, self.init, self.hit_bonus, self.shield = 1, 0, 0, 0
		self.type = type
		self.weapons = []
		self.parts = []
		self.build_weapons(weapons)
		self.build_parts(parts)
	end

	def build_weapons(weapons)
		weapons.each do |weapon_name, amount|
			(1..amount).each do |n|
				self.weapons << Weapon.new(weapon_name)
			end
		end
	end

	def build_parts(parts)
		parts.each do |part_name, amount|
			(1..amount).each do |n|
				newPart = Part.new(part_name)				
				self.parts << newPart
				
				if newPart.hp.is_a? Integer
					self.hp += newPart.hp
				end
				
				if newPart.init.is_a? Integer
					self.init += newPart.init
				end

				if newPart.hit_bonus.is_a? Integer
					self.hit_bonus += newPart.hit_bonus
				end
				
				if newPart.shield.is_a? Integer
					self.shield += newPart.shield
				end

			end
		end
	end

	def roll_attacks()
		rolls = []
		if !self.weapons.empty? 
			self.weapons.each do |weapon|
				(1..weapon.attacks).each do |n|
					raw = 1 + rand(6)
					rolls << {"raw" => raw, "damage" => weapon.damage}
				end
			end
			return rolls
		end
		return []
	end

end