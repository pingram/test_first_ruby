def reverser(&block)
	# yield.reverse
	block.call.split(/\s+/).map { |elem| elem.reverse }.join(' ')
	
end

def adder(num = 1)
	yield + num
end

def repeater(num = 1)
	num.times { yield }
end