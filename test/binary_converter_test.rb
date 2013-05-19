require "test/unit"
require "./lib/helper"

class BinaryConverterTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_number_to_binary_array
		# Prepare...
		number = 2

		# Perform...
		binary = BinaryConverter.instance.number_to_binary_array number, 5

		# Assert...
		assert_equal [0,0,0,1,0], binary
	end
	def test_binary_array_to_number
		# Prepare...
		binary = [1,0,1,1]
	
		# Perform...
		number = BinaryConverter.instance.binary_array_to_number binary

		# Assert...
		assert_equal 11, number
	end
end