class Timer
	attr_accessor :seconds
	
	def initialize
		@seconds = 0
	end
	
	def time_string
		i = 3600											# iteration variable
		time_s = ''										#	the time string to return
		seconds = @seconds
		3.times do
			time_s += ':' if i != 3600	# run every time but the first one
			if seconds / i < 10					# needed for small values
				time_s += '0'
			end
			time_s += (seconds / i).to_s
			seconds = seconds % i				# update seconds
			i /= 60
		end
		return time_s
	end
	
end