class Array
	def sum
		return 0 if self.empty?
		sum = 0
		self.map { |elem| sum += elem }
		return sum
	end
	
	def square
		return self if self.empty?
		self.map { |elem| elem = elem * elem }
	end
	
	def square!
		self.each_with_index do |elem, i|
			self[i] = elem * elem
		end
	end
end