require "helper"

class ObjectDaoTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_save
		# Prepare...
		tests = MMPI2Generator.instance.generate 2
	
		# Perform...
		@target.save tests

		# Assert...
		assert File.exist?(TEST_DAO_FILE_NAME)
	end

	def test_load
		# Prepare...
		@target.save(MMPI2Generator.instance.generate 1)

		# Perform...
		tests = @target.load
	
		# Assert...
		assert_not_nil tests
	end

	def setup
		@target = ObjectDao.new TEST_DAO_FILE_NAME
		FileHelper.delete TEST_DAO_FILE_NAME
	end

	def teardown
		FileHelper.delete TEST_DAO_FILE_NAME
	end

	TEST_DAO_FILE_NAME = "test_dao_file"
end