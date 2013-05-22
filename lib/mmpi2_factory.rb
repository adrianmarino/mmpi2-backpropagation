class MMPI2Factory
	include Singleton

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def new_test
		MMPI2.new dep_copy(@sentences)
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def dep_copy(an_object)
		Marshal.load(Marshal.dump(an_object))
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize
		@sentences = SentenceFileReader.new(SENTENCES_FILE_NAME).read_all
	end
end