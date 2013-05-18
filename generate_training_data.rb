require './helper'

puts "Remove old file..."
delete_dao_file

tests_count = ARGV[0].to_i
puts "Generate #{tests_count} random tests..."
tests = MMPI2Generator.instance.generate tests_count

puts "Calculate results for all tests..."
tests.each {|a_test|a_test.calculate_results}

MMPI2Dao.new(MMPI2_DAO_FILE_NAME).save tests
