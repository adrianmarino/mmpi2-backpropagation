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
		input = a_test.answers_array

		log_value = "  - Input: Size: #{input.size}, Array: #{input}\n  - Output: Size: #{output.size}, Value: #{output_value}, Array: #{output}\n  - Error: #{error}"

		@logger.info log_value
		puts log_value
	end

	def end_train_test
		log_value = "Net trained..."
		@logger.info log_value
		puts log_value 
	end


	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize
		@logger = LoggerFactory.instance.logger
	end
end