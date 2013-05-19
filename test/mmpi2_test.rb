require "./lib/helper"

class MMPI2Test < Test::Unit::TestCase
	def test_depression_level_all_answer_yes
		# Prepare...
		test = MMPI2.new sentences
		test.answer_yes_for_all_sentences
	
		# Perform...
		test.calculate_results

		# Assert...
		assert_equal 20, test.depression_level
	end

	def test_depression_level_all_answer_no
		# Prepare...
		test = MMPI2.new sentences
		test.answer_no_for_all_sentences
	
		# Perform...
		test.calculate_results

		# Assert...
		assert_equal 17, test.depression_level
	end

	def test_answers_array
		# Prepare...
		test = MMPI2.new sentences
		test.answer_yes_for_all_sentences
	
		# Perform...
		answers = test.answers_array
	
		# Assert...
		assert_equal 32, answers.size
	end

	def test_answer_yes_for_all_sentences
		# Prepare...
		test = MMPI2.new sentences
		
		# Perform...
		test.answer_yes_for_all_sentences

		# Assert...
		answers = test.answers_array
	  assert_equal 32, test.answers_array.inject(0) {| a_value, an_answer | a_value + an_answer}
	end

	def test_answer_no_for_all_sentences
		# Prepare...
		test = MMPI2.new sentences
		
		# Perform...
		test.answer_no_for_all_sentences

		# Assert...
		answers = test.answers_array
	  assert_equal 0, test.answers_array.inject(0) {| a_value, an_answer | a_value + an_answer}
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