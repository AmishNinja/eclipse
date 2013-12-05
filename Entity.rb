require './part'
require './weapon'

class Entity
	attr_accessor :hp, :init, :hit_bonus, :shield, :type, :weapons, :parts, :belongs_to, :is_attacker

	def initialize(weapons, parts, type)
		@hp, @init, @hit_bonus, @shield = 1, 0, 0, 0
		@type = type
		self.weapons, self.parts = [], []
		blueprint(weapons, parts)
	end

	include Comparable
	def <=> other
		return 0 if (self.init == other.init && !self.is_attacker && !other.is_attacker)
		return 1 if (self.init == other.init && other.is_attacker) || (self.init > other.init && !self.is_attacker && !other.is_attacker)
		return -1 if (self.init < other.init && !self.is_attacker && !other.is_attacker) || (self.init == other.init && self.is_attacker) 
		self.init <=> other.init
	end

	def blueprint(weapons, parts)
		apply_weapons(weapons)
		apply_parts(parts)
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
				newPart = Part.new(self, part_name)				
				self.parts << newPart
			end
		end
	end

	def roll()
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

	def target_roll(entity)
		target = 6 - self.hit_bonus + entity.shield
		if target > 6 then target = 6 end
		return target
	end		 

	def attack(entity)
		rolls = self.roll
		target = 6 - self.hit_bonus + entity.shield
		if target > 6 then target = 6 end
		damage_dealt = 0
		rolls.each do |roll|
			if roll["raw"] >= target
				damage_dealt += roll["damage"]
			end
		end
		entity.hp -= damage_dealt
	end

	def destroyed?
		if @hp <= 0
			return true
		end
		return false
	end

	def name
		return @belongs_to + " " + @type
	end

	def assign= value

	end

end