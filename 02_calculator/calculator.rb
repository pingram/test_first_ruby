def add(num1, num2)
	num1 + num2
end

def subtract(num1, num2)
	num1 - num2
end

def sum(arr_in)
	return 0 if arr_in.empty?
	sum = 0
	arr_in.each { |elem| sum += elem }
	return sum
end

def multiply(arr_in)
	return nil if arr_in.empty?
	total = arr_in.first
	arr_in.delete_at(0)
	arr_in.each { |elem| total *= elem }
	total
end

def power(arr_in)
	return nil if arr_in.length != 2
	total = 1
	arr_in.last.times { total*= arr_in.first }
	total
end

def factorial(num)
	return nil if num < 0
	return 1 if num.equal?(0)
	i = 1
	total = 1
	num.times do
		total *= i
		i += 1
	end
	return total
end