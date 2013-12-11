require './LinkedList.rb'

class ShipList < List

	def report
		current = @head
		shipList = []
		while current.next != nil
			shipList << "#{current.element.belongs_to.to_s} #{current.element.type}"
			current = current.next
		end
		shipList << "#{current.element.belongs_to.to_s} #{current.element.type}"
		return shipList.join("->")
	end

	def find_target(ship)

	end

	def battle
		while !self.declare_winner?
			self.battle_round
		end
		return @head.element.belongs_to
	end

	def battle_round
		current = @head

	end

	def declare_winner?
		current = @head
		match_id = current.element.belongs_to
		while current.next != nil
			current = current.next
			if current.element.id != match_id
				return false
			end
		end
		return true
	end

end