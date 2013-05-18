require "test/unit"
require "./helper"

class MMPI2GeneratorTest < Test::Unit::TestCase
	def test_generate
		# prepare...
		tests = MMPI2Generator.instance.generate 2

		# Assert...
		assert_tests tests
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def assert_tests(tests)
		assert(tests.all?{|a_test|
			a_test.was_completed;
			a_test.depression_level > 0
		})
	end
end

