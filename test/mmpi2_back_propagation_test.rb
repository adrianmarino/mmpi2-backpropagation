require "test/unit"
require "./helper"

class MMPI2BackPropagationTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_results_of
		# Perform...
		@target.train MMPI2Generator.instance.generate(300)
		test = MMPI2Generator.instance.generate
		test.answer_yes_for_all_sentences

		# perform...
		results = @target.results_of test

		# Assert...
		assert_equal 20, results_of.depression_level
	end

	def setup
		@target = MMPI2BackPropagation.new
	end

	def teardown
		@target.reset
	end
end