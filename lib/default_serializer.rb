class DefaultSerializer
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def save_to(objects, a_file)
		Marshal.dump(objects, a_file)
	end

	def load_from(a_file)
		Marshal.load(a_file)
	end
end