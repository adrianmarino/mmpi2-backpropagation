class BinaryOutputConverter < OutputConverter
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def output_to_number(a_value)
		NetOutputConverter.instance.bynary_output_to_number a_value
	end

	def number_to_output(a_value)
		NetOutputConverter.instance.number_to_binary_output a_value, @output_size
	end
end