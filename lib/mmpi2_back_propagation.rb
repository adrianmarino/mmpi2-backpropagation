class MMPI2BackPropagation
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def train(tests, a_max_error = NetConfiguration::MAX_ERROR)
		count = 1
		tests.each {|a_test|
			error = 0
			puts "Test #{count}..."	
			input = a_test.answers_array
			output_value  = a_test.depression_level
			output = @converter.number_to_output(output_value)
			puts "  - Input: Size: #{input.size}, Array: #{input}"
			puts "  - Output: Size: #{output.size}, Value: #{output_value}, Array: #{output}"
			begin
				error = @net.train input, output
			end while error >= a_max_error
			puts "  - Error: #{error}"
			count+=1
		}
		puts "Net trained.."
  end

	def results_of(a_test)
		result = @net.eval a_test.answers_array
	  new_result result 
	end

	def reset
		@net = Ai4r::NeuralNetwork::Backpropagation.new(@neuron_levels)
		@net.learning_rate = @learning_rate
		@net.momentum = @momentum
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def new_result(an_output)
		MMPI2BackPropagationResult.new an_output, @converter.output_to_number(an_output)
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_writer :neuron_levels, :momentum, :learning_rate

  # -------------------------------------------------------------------------
  # Initialize...
  # -------------------------------------------------------------------------
  def initialize(a_converter, neuron_levels = [32,20,5], a_learning_rate = 0.25, a_momentum = 0.1)
  	@converter = a_converter
  	@neuron_levels = neuron_levels
  	@momentum = a_momentum
  	@learning_rate = a_learning_rate
		reset
  end

	def self.new_configured
		MMPI2BackPropagation.new NetConfiguration::OUTPUT_CONVERTER, NetConfiguration::NEURON_LEVELS, NetConfiguration::LEARNING_RATE, NetConfiguration::MOMENTUM
	end
end






	# def train(tests, a_max_error = NetConfiguration::MAX_ERROR)
	# 	train_count = 1
	# 	previous_error = 5
	# 	error = 0
	# 	begin
	# 		test_count = 1
	# 		puts "Begin Train #{train_count}..."
	# 		tests.each {|a_test|
	# 			input = a_test.answers_array
	# 			output_value  = a_test.depression_level
	# 			output = number_to_output(output_value)
	# 			error = @net.train input, output
	# 			puts "   Test #{test_count}..."
	# 			puts "      - Input: Size: #{input.size}, Array: #{input}"
	# 			puts "      - Output: Size: #{output.size}, Value: #{output_value}, Array: #{output}"
	# 			puts "      - Error: #{error}"
	# 			test_count+=1
	# 		}
	# 		puts "End Train #{train_count} with Error: #{error}..."
	# 		train_count+=1

	# 		if train_count % 20 == 0
	# 			puts "Check Error => Previous: #{previous_error}, Actual: #{error}"
	# 			if previous_error+0.2 < error
	# 				break
	# 			end
	# 			previous_error = error
	# 		end
	# 	end while error >= a_max_error 
	# 	puts "Net trained.."
 	#  end
