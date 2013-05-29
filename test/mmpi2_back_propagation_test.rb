require "helper"

class MMPI2BackPropagationTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_results_of
		# Perform...
		@target.train MMPI2Generator.instance.generate(20)
		test = MMPI2Generator.instance.generate.first
		test.answer_yes_for_all_sentences

		# perform...
		result = @target.results_of test

		# Assert...
		assert result.value >= 16, "Value #{result.value} not equal or grether than 16."
		assert result.value <= 33, "Value #{result.value} not equal or less than 23." 
	end

	def setup
		@target = MMPI2BackPropagation.new_configured
	end

	def teardown
		@target.reset
	end
end