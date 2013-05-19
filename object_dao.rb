class ObjectDao
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def save(objects)
		File.open(@path, WRITE_ONLY) do|a_file|
		 Marshal.dump(objects, a_file)
		end
		puts "Objects saved on #{@path} file..."
	end

	def load
		objects = []
		if File.exists?(@path)
	  	File.open(@path, READ_ONLY){|a_file|objects = Marshal.load(a_file)}
	  else
	  	objects = nil
	  end
	  puts "Objects loaded from #{@path} file..."
	  objects
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_path)
		@path = a_path
	end
end