require "test/unit"
require "helper"

class MMPI2FactoryTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_new_test
		# Perform...
		test = MMPI2Factory.instance.new_test

		# Assert...
		assert_not_nil test
		assert test.has_sentences
	end
end