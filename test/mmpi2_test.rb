require "./helper"

class MMPI2Test < Test::Unit::TestCase
	def test_depression_level
		# Prepare...
		test = MMPI2.new sentences
		test.answer_yes_for_all_sentences
	
		# Perform...
		test.calculate_results

		# Assert...
		assert_equal 20, test.depression_level
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def sentences
		reader = SentenceFileReader.new SENTENCES_FILE_NAME
		reader.read_all
	end
end