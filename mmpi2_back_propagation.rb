require "./helper"

class MMPI2BackPropagation
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def train(tests, a_max_error = NetConfiguration::MAX_ERROR)
		count = 1
		tests.each {|a_test|
			puts "Train with test #{count}..."
			begin
				error = @net.train a_test.answers_array, to_binary_array(a_test.depression_level)
			end while error > a_max_error 
			puts "Error: #{error}."
			count+=1
		}
  end

	def results_of(a_test)
	  MMPI2BackPropagationResult.new @net.eval(a_test.answers_array)
	end

	def reset
		@net = Ai4r::NeuralNetwork::Backpropagation.new(@neuron_levels)
		@net.learning_rate = @learning_rate
		@net.momentum = @momentum
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_writer :neuron_levels, :momentum, :learning_rate

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def to_binary_array(a_value)
		BinaryConverter.instance.number_to_binary_array a_value, 5
	end

	def to_number(a_value)
		BinaryConverter.instance.binary_array_to_number a_value
	end

  # -------------------------------------------------------------------------
  # Initialize...
  # -------------------------------------------------------------------------
  def initialize(neuron_levels = [32,32,5], a_learning_rate = 0.25, a_momentum = 0.1)
  	@neuron_levels = neuron_levels
  	@momentum = a_momentum
  	@learning_rate = a_learning_rate
		reset
  end

	def self.new_configured
		MMPI2BackPropagation.new NetConfiguration::NEURON_LEVELS, NetConfiguration::LEARNING_RATE, NetConfiguration::MOMENTUM
	end
end
