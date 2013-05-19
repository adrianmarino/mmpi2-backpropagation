require "../lib/output_converter"
require "../lib/binary_output_converter"
require "../lib/output_by_number_converter"

module NetConfiguration
	NEURON_LEVELS = [32,20,5]
	LEARNING_RATE = 0.25
	MOMENTUM = 0.1
	MAX_ERROR = 0.001
	OUTPUT_CONVERTER = BinaryOutputConverter.new 5
end
