def translate(str_in)
	#call translate_word
	result = str_in.split(/\s+/).map { |word| translate_word(word) }
	return result.join(' ')
end

def translate_word(word)
	vowels = %w(a e i o u)
	word_a = word.split('')
	
	# Test for vowel start of word
	if vowels.include?(word[0])		#TS
		return word + 'ay'
		
	# otherwise consonant start of word
	else		#TS
		i = 0
		prev_letter = ''
		
		# determine how many consonants
		word_a.each do |letter|		#TS
			# if next letter is consonant or u preceeded by q
			if !vowels.include?(letter) || (vowels.include?(letter) && prev_letter == 'q')
				prev_letter = letter
				i += 1
			else
				break
			end
		end
		
		# rearrange word
		s_to_move = word[0...i]
		word = word.sub(s_to_move,'')
		word = word + s_to_move + 'ay'
	end
	return word
end