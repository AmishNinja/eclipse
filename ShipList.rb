require './linkedlist'

class ShipList < List

	def report
		current = @head
		shipList = []
		while current.next != nil
			shipList << "player#{current.element.belongs_to.to_s}:#{current.element.type}"
			current = current.next
		end
		shipList << "player#{current.element.belongs_to.to_s}:#{current.element.type}"
		return shipList.join("->")
	end

	def find_target(ship)

	end

end