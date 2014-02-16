class Book
	@title

	def title=(value)
		str_arr = value.split(/\s+/)
		#excluded words to not capitalize
		excluded_words = %w(the in a an as and to of for over)
		#capitalize all words not in excluded_words
		str_arr = str_arr.map { |elem| excluded_words.include?(elem) ? elem : elem.capitalize }
		#capitalize first letter
		str_arr[0] = str_arr[0].capitalize
		@title = str_arr.join(' ')
	end

	def title
		@title
	end
end