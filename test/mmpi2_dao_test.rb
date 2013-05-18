require "test/unit"
require "./helper"

class MMPI2DaoTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_save
		# Prepare...
		delete_dao_file
		tests = MMPI2Generator.instance.generate 2
	
		# Perform...
		@target.save tests

		# Assert...
		assert File.exist?(MMPI2_DAO_FILE_NAME)
	end

	def test_load
		# Prepare...
		@target.save(MMPI2Generator.instance.generate 1)

		# Perform...
		tests = @target.load
	
		# Assert...
		assert_not_nil tests
		puts tests
	end

	def setup
		@target = MMPI2Dao.new MMPI2_DAO_FILE_NAME
	end
end