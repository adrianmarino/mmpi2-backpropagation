require "helper"

class NetOutputConverterTest < Test::Unit::TestCase

	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------

	def test_number_to_output_zero
		# Prepare...
		number = 0

		# Perform...
		output = NetOutputConverter.instance.number_to_output number, 4
	
		# Assert...
		assert_equal [1,0,0,0], output		
	end

	def test_number_to_output_one
		# Prepare...
		number = 1
	
		# Perform...
		output = NetOutputConverter.instance.number_to_output number, 4
	
		# Assert...
		assert_equal [0,1,0,0], output		
	end

	def test_number_to_output_two
		# Prepare...
		number = 2

		# Perform...
		output = NetOutputConverter.instance.number_to_output number, 4
	
		# Assert...
		assert_equal [0,0,1,0], output		
	end

	def test_number_to_output_tree
		# Prepare...
		number = 3
	
		# Perform...
		output = NetOutputConverter.instance.number_to_output number, 4
	
		# Assert...
		assert_equal [0,0,0,1], output		
	end

	def test_output_to_number_zero
		# Prepare...
		output = [1,0,0,0]
	
		# Perform...
		number = NetOutputConverter.instance.output_to_number output

		# Assert...
		assert_equal 0, number
	end

	def test_output_to_number_one
		# Prepare...
		output = [0,1,0,0]
	
		# Perform...
		number = NetOutputConverter.instance.output_to_number output

		# Assert...
		assert_equal 1, number
	end

	def test_output_to_number_two
		# Prepare...
		output = [0,0,1,0]
	
		# Perform...
		number = NetOutputConverter.instance.output_to_number output

		# Assert...
		assert_equal 2, number
	end

	def test_output_to_number_tree
		# Prepare...
		output = [0,0,0,1]
	
		# Perform...
		number = NetOutputConverter.instance.output_to_number output

		# Assert...
		assert_equal 3, number
	end
end