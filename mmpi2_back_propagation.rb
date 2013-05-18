require "./helper"

class MMPI2BackPropagation
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def train(tests)
		tests.each {|a_test| 
 			result = to_binary_array a_test.depression_level
			@net.train(a_test.answers_array, result) 
		}
  end

	def results_of(a_test)
	  result = MMPI2BackPropagationResult.new @net.eval(a_test.answers_array)
	  puts result
	  result
	end

	def reset
		@net = Ai4r::NeuralNetwork::Backpropagation.new([32,32,32,32,32, 5])
	end

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
  def initialize()
		reset   	
  end
end
