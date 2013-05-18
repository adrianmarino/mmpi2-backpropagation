require './helper'

puts "Remove old file..."
delete_dao_file
tests_count = ARGV[0].to_i
puts "Generate #{tests_count} random tests..."
tests = MMPI2Generator.instance.generate tests_count
MMPI2Dao.new(MMPI2_DAO_FILE_NAME).save tests
