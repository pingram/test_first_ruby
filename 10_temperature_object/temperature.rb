class Temperature
	#temperature will be stored in Celsius
	def initialize(hash_in)
		if hash_in.has_key?(:f)
			@temp = ftoc(hash_in[:f])
		elsif hash_in.has_key?(:c)
			@temp = hash_in[:c].to_f
		end
	end
	
	def in_celsius
		@temp
	end
	
	def in_fahrenheit
		ctof(@temp)
	end
	
	def self.from_celsius(degC)
		self.new( { c: degC } )
	end
	
	def self.from_fahrenheit(degF)
		self.new( { f: degF } )
	end
	
	def ctof(degC)
		degC * (9.0 / 5.0) + 32
	end
	
	def ftoc(degF)
		(degF - 32) * (5.0 / 9.0)
	end
	
	private :ftoc, :ctof
end

class Celsius < Temperature
	def initialize(temp_in)
		super( { c: temp_in } )
	end
end

class Fahrenheit < Temperature
	def initialize(temp_in)
		super( { f: temp_in } )
	end
end