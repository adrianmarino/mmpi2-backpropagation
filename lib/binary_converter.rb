class BinaryConverter
	include Singleton

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def number_to_binary_array(a_number,a_size)
		binary = a_number.to_s(2).split(//).collect {|a_binary|a_binary.to_i}

		if binary.size < a_size
			(a_size - binary.size).times {|index| binary.unshift(0)}
		end
		binary
	end

	def binary_array_to_number(binary_array)
		binary_array = round(binary_array).inject(""){|value,number|value+number.to_s}.to_i(2)
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	def round(result)
		result.collect { |a_value| a_value.round }
	end
end