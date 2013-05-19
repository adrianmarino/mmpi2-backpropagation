require "../lib/output_converter"
require "../lib/binary_output_converter"
require "../lib/output_by_number_converter"

module NetConfiguration
	# Neurons by level...
	NEURON_LEVELS = [32,50,50,5]

	# Learning rate: beetween 0,05 and 0,25...
	LEARNING_RATE = 0.25

	# Convergence speed...
	MOMENTUM = 0.1

	# Max net error...
	MAX_ERROR = 0.001

	# Output converter used...
	OUTPUT_CONVERTER = BinaryOutputConverter.new 5
end
