require './helper'

class MMPI2Factory
	include Singleton

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def new_test
		MMPI2.new @sentences.clone
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize
    @sentences = SentenceFileReader.new(SENTENCES_FILE_NAME).read_all
  end
end