class NetOutputConverter
	include Singleton

	def number_to_output(a_value, a_size)
			result_array = []
			a_size.times{|i| result_array[i] = i == a_value ? 1 : 0  }
			result_array
	end

	def output_to_number(an_output)
		output = round(an_output)
		index_of output, 1
		#value = index_of output, 1
		# puts "OUTPUT: #{output}, VALUE: #{value}"
		# value
	end

	def number_to_binary_output(a_value, a_size)
		BinaryConverter.instance.number_to_binary_array a_value, a_size
	end

	def bynary_output_to_number(a_value)
		BinaryConverter.instance.binary_array_to_number a_value
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	
	def round(result)
		result.collect { |a_value| a_value.round }
	end

	def index_of(an_array, a_value)
		index = 0
		selected_position = -1
		while selected_position == -1
			if an_array[index] == a_value
				selected_position = index
				break
			end
			index+=1
		end
		selected_position
	end
end

