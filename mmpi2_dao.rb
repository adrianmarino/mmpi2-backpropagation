class MMPI2Dao
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def save(tests)
		File.open(@path, WRITE_ONLY) do|a_file|
		 YAML.dump(tests, a_file)
		end
		puts "Tests saved on #{@path} file..."
	end

	def load
		tests = []
		if File.exists?(@path)
	  	File.open(@path, READ_ONLY){|a_file|tests = YAML.load(a_file)}
	  else
	  	tests = nil
	  end
	  puts "Tests loaded from #{@path} file..."
	  tests
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_path)
		@path = a_path
	end
end