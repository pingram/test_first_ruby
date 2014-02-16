class Friend
	# this function says hello to other_person if specified, but otherwise just
	# says hello
	def greeting(other_person = nil)
		return "Hello!" if other_person.nil?
		return "Hello, #{other_person}!"
	end
end