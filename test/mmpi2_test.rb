require "./helper"

class MMPI2Test < Test::Unit::TestCase
	def test_method_name
		# Prepare...
		test = MMPI2.new sentenses
		test.answer_yes_for_all_sentences
	
		# Perform...
		level = test.depression_level

		# Assert...
		assert_equal 20, level
	end


	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def sentences
		reader = SentenceFileReader SENTENCES_FILE_NAME
		reader.read_all
	end
end