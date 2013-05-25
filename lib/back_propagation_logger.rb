class BackPropagationLogger
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def begin_train_test(a_count)
		log_value = "Test #{a_count}..."
		@logger.info log_value
		puts log_value
	end

	def test_trained(a_test, output, error)
		output_value  = a_test.depression_level
		min_output_value = min_value output_value
		max_output_value = max_value output_value
		input = a_test.answers_array

		log_value = "  - Input: Size: #{input.size}, Array: #{input}\n  - Output: Size: #{output.size}, Value: #{output_value} (Min:#{min_output_value}/Max:#{max_output_value}), Array: #{output}\n  - Error: #{error}"

		@logger.info log_value
		puts log_value
	end

	def end_train_test
		log_value = "Net trained..."
		@logger.info log_value
		puts log_value 
	end

	def min_value(a_value)
		if a_value < @min
			@min = a_value
		end
		@min
	end

	def max_value(a_value)
		if a_value > @max
			@max = a_value
		end
		@max
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize
		@min = 1000
		@max = 0
		@logger = LoggerFactory.instance.logger
	end
end