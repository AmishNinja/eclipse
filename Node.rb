class Node
	attr_accessor :element, :next

	def initialize(element, next_node = nil)
		@element = element
		@next = next_node
	end
end


class List
	attr_accessor :head, :tail
	attr_reader :length

	def initialize(*elements)
		@length = elements.length
		@head = Node.new(elements.shift)
		elements.each { |element| self.push(element) }
	end

	def push(element)
		node = Node.new(element)
		current = @first
		while current.next != nil
			current = current.next
		end
		current.next = node
		@length++

		return self
	end

	def delete(element)
		current = @head
		if current.element == element
			@head = @head.next
		else
			current = @head
			while (current != nil) && current.next && current.next.element != element
				current = current.next
			end

			if (current != nil) && current.next != nil
				current.next = current.next.next
			end
		end
	end



end