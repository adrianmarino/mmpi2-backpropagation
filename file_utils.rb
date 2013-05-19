require "./helper"

module FileUtils
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------	
	def self.delete(a_path)
		File.delete(a_path) if File.exist?(a_path)
	end

end 