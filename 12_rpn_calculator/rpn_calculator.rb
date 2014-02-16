require 'debugger'

class RPNCalculator
	@stack
	@temp_stack
	
	def initialize
		@stack = []
		@temp_stack = []
	end
	
	def push(num)
		@stack.push(num)
	end
	
	def plus
		check_empty_calculator
		@stack.push(:+)
	end
	
	def minus
		check_empty_calculator
		@stack.push(:-)
	end
	
	def times
		check_empty_calculator
		@stack.push(:*)
	end
	
	def divide
		check_empty_calculator
		@stack.push(:/)
	end
	
	def check_empty_calculator
		raise("calculator is empty") if @stack.length < 2
	end
	
	def tokens(str_in)
		syms_in, syms_update = [], []
		str_in.split(' ').each { |val| syms_in << val.to_sym }
		# puts "syms_in: #{syms_in}"
		op_syms = [:+, :-, :*, :/]
		# convert the number symbols to Fixnums, leave the operator symbols alone
		syms_in.map do |symbol|
			if op_syms.include?(symbol)
				syms_update << symbol
			else
				syms_update << symbol.to_s.to_i
			end
		end
		@stack = syms_update.clone
	end
	
	def evaluate(str_in)
		tokens(str_in)
		value
	end
	
	# we assume that the value coming in is an operator; also, if the function is
	# called externally, we reset the @temp_stack
	def value(ext_call = true)				
		@temp_stack = @stack.clone if ext_call
		# puts "temp stack value from value: #{@temp_stack}"
		call_op = @temp_stack.pop			
		if call_op == :+
			value = calc_plus
		elsif call_op == :-
			value = calc_minus
		elsif call_op == :*
			value = calc_times
		elsif call_op == :/
			value = calc_divide
		end
		return value
	end
	
	def calc_plus
		nums = []
		2.times do
			# puts "temp stack value from plus: #{@temp_stack}"
			unless @temp_stack.last.is_a?(Fixnum)
				# puts "calling value again"
				nums << value(false)
			else
				nums << @temp_stack.pop
			end
		end
		return nums[0] + nums[1]
	end
	
	def calc_minus
		nums = []
		2.times do
			# puts "temp stack value from plus: #{@temp_stack}"
			unless @temp_stack.last.is_a?(Fixnum)
				# puts "calling value again"
				nums << value(false)
			else
				nums << @temp_stack.pop
			end
		end
		return nums[1] - nums[0]
	end
	
	def calc_times
		nums = []
		2.times do
			# puts "temp stack value from plus: #{@temp_stack}"
			unless @temp_stack.last.is_a?(Fixnum)
				# puts "calling value again"
				nums << value(false)
			else
				nums << @temp_stack.pop
			end
		end
		return nums[1] * nums[0]
	end
	
	def calc_divide
		nums = []
		2.times do
			# puts "temp stack value from plus: #{@temp_stack}"
			unless @temp_stack.last.is_a?(Fixnum)
				# puts "calling value again"
				nums << value(false)
			else
				nums << @temp_stack.pop
			end
		end
		return nums[1].to_f / nums[0].to_f
	end
	
end