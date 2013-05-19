require './helper'
tests_count = ARGV[0].to_i
puts "Generate #{tests_count} random tests..."
tests = MMPI2Generator.instance.generate tests_count

puts "Train net..."
net = MMPI2BackPropagation.new
net.train(tests)

ObjectDao.new(MMPI2_NET_FILE_NAME).save net
