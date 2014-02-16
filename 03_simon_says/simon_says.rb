def echo(string_in)
	string_in
end

def shout(string_in)
	string_in.upcase
end

# repeats the string_in num_times
def repeat(string_in, num_times = 2)
	string_out = string_in
	(num_times - 1).times do
		string_out += " #{string_in}"
	end
	return string_out
end

# returns the word until the letter index specified
def start_of_word(str_in, letter_num)
	str_in[0...letter_num]
end

# returns the first word in a string
def first_word(str_in)
	str_in.split(/\s+/).first
end

# capitalizes appropriate words to make a titleru
def titleize(str_in)
	str_arr = str_in.split(/\s+/)
	excluded_words = %w(the in a an as and for over)
	# capitalize all words not in excluded_words
	str_arr = str_arr.map { |elem| excluded_words.include?(elem) ? elem :
			elem.capitalize }
	str_arr[0] = str_arr[0].capitalize
	result = str_arr.join(' ')
	return result
end