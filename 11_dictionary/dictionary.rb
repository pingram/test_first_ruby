class Dictionary
	attr_accessor :entries
	
	def initialize
		@entries = {}
	end
	
	# merge the input with the entries
	def add(input)
		if input.is_a?(Hash)
			@entries = @entries.merge(input)
		else
			@entries = @entries.merge(input => nil)
		end
	end
	
	def keywords
		@entries.keys.sort
	end
	
	def include?(possible_key)
		@entries.keys.any? { |key| key == possible_key }
	end
	
	# find the key that starts with the same letters as find_key
	def find(find_key)
		# return nil if @entries.empty?
		return_hash = {}
		fk_length = find_key.length
		@entries.each do |key, value|
			# only look in keys that are at least as long as find_key
			if key.length >= find_key.length
				# only compare part of the key if it is longer than the find_key
				if key[0...find_key.length] == find_key
					return_hash[key] = value
				end
			end
		end
		return_hash
	end
	
	# return a string of output to print with the entries
	def printable
		str_out = ''
		count = 0
		self.keywords.each do |key| 			#use keywords to ensure it's sorted
			count += 1
			str_out += "[#{key}] \"#{@entries[key]}\""
			# append \n if not the last entry
			str_out += "\n" if count != self.keywords.length
		end
		str_out
	end
end