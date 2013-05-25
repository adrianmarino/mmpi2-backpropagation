class MMPI2BackPropagation
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def train(tests, times = 10, a_max_error = NetConfiguration::MAX_ERROR)
		logger = BackPropagationLogger.new
		count = 1
		times.times{|i|
			tests.each {|a_test|
				logger.begin_train_test count

				output = @converter.number_to_output(a_test.depression_level)
				begin
					error = @net.train a_test.answers_array, output
				end while error >= a_max_error
				count+=1
				
				logger.test_trained a_test, output, error
			}
		}
		logger.end_train_test
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
	attr_writer :neuron_levels, :momentum, :learning_rate, :converter

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