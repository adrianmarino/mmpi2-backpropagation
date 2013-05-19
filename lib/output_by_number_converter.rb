class OutputByNumberConverter < OutputConverter
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def output_to_number(a_value)
		NetOutputConverter.instance.output_to_number a_value
	end

	def number_to_output(a_value)
		NetOutputConverter.instance.number_to_output a_value, @output_size
	end
end