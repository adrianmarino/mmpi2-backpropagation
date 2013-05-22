class MMPI2BackPropagation
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def train(tests, times = 20, a_max_error = NetConfiguration::MAX_ERROR)
		count = 1
		times.times{|i|
			tests.each {|a_test|
				@logger.info "Test #{count}..."	
				input = a_test.answers_array
				output_value  = a_test.depression_level
				output = @converter.number_to_output(output_value)
				@logger.info "  - Input: Size: #{input.size}, Array: #{input}"
				@logger.info "  - Output: Size: #{output.size}, Value: #{output_value}, Array: #{output}"
				error = @net.train input, output
				begin
					error = @net.train input, output
				end while error >= a_max_error 
				@logger.info "  - Error: #{error}"
				count+=1
			}
		}
		@logger.info "Net trained..."
  end

	def train2(tests, a_max_error = NetConfiguration::MAX_ERROR)
 		count = 1
		previous_error = 5
 		error = 0
 		begin
 			tests.each {|a_test| error = @net.train(a_test.answers_array,to_binary_array(a_test.depression_level)) }
 			@logger.info "Train #{count} => Error: #{error}..."
 			count+=1

 		end while error >= a_max_error 
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
  	@logger = LoggerFactory.instance.logger
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