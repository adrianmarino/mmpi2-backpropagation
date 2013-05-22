class YmlSerializer
		# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def save_to(objects, a_file)
		YAML.dump(objects, a_file)
	end

	def load_from(a_file)
		YAML.load(a_file)
	end
end