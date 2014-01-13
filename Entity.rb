require './Part.rb'
require './Weapon.rb'

class Entity
	attr_accessor :blueprint, :damage
	attr_reader :player

	include Comparable
	def <=> other
		return 0 if (self.init == other.init && !self.is_attacker? && !other.is_attacker?)
		return 1 if (self.init == other.init && other.is_attacker?) || (self.init > other.init && !self.is_attacker? && !other.is_attacker?)
		return -1 if (self.init < other.init && !self.is_attacker? && !other.is_attacker?) || (self.init == other.init && self.is_attacker?) 
		self.init <=> other.init
	end

	def hp
		self.blueprint.hp
	end

	def init
		self.blueprint.init
	end

	def hit_bonus
		self.blueprint.hit_bonus
	end

	def shield
		self.blueprint.shield
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
		entity.damage += damage_dealt
	end

	def destroyed?
		if self.damage >= self.hp
			return true
		end
		return false
	end

	def title
		return "player " + self.player.id + " " + self.blueprint.type
	end

end