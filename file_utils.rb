require 'singleton' 

class FileUtils
	include Singleton
	
	# -------------------------------------------------------------------------
	# Methods...
	# -------------------------------------------------------------------------
	def delete(a_path)
		File.delete a_path if File.exist? a_path
	end

end 