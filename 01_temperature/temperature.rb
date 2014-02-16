#temperature 

def ftoc(temp_in)
	(temp_in - 32) * (5.0/9.0)
end

def ctof(temp_in)
	temp_in * (9.0/5.0) + 32
end