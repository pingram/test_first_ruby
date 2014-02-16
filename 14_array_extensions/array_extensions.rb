class Array
	# sum the elements in the array
	def sum
		return 0 if self.empty?
		sum = 0
		self.map { |elem| sum += elem }
		return sum
	end
	
	# square the elements in the array
	def square
		return self if self.empty?
		self.map { |elem| elem = elem * elem }
	end
	
	# square bang the array
	def square!
		self.each_with_index do |elem, i|
			self[i] = elem * elem
		end
	end
end