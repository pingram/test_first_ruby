class Friend
	def greeting(other_person = nil)
		return "Hello!" if other_person.nil?
		return "Hello, #{other_person}!"
	end
end