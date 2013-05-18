require "./helper"

class MMPI2BackPropagation
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def train(tests)
		tests.each {|a_test| @net.train(a_test.answers_array, [a_test.depression_level]) }
  end

	def results_of(a_test)
	  @net.eval(a_test.answers_array)	
	end

	def reset
		@net = Ai4r::NeuralNetwork::Backpropagation.new([32, 32, 1])   
	end

  # -------------------------------------------------------------------------
  # Initialize...
  # -------------------------------------------------------------------------
  def initialize()
		reset   	
  end
end
