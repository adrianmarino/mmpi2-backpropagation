class ObjectDao
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def save(objects)
		File.open(@path, WRITE_ONLY) do|a_file|
		 @serializer.save_to objects, a_file
		end
		puts "Objects saved on #{@path} file..."
	end

	def load
		objects = []
		if File.exists?(@path)
	  	File.open(@path, READ_ONLY){|a_file|objects = @serializer.load_from a_file}
	  else
	  	objects = nil
	  end
	  puts "Objects loaded from #{@path} file..."
	  objects
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_path, a_serializer = DefaultSerializer.new)
		@path = a_path
		@serializer = a_serializer
	end
end