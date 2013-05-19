require './helper'

# Parameneters...
tests_count = ARGV[0].to_i
times = ARGV[1].to_i

puts "Generate #{tests_count} random tests..."
tests = MMPI2Generator.instance.generate tests_count

puts "Train net #{times} times..."
net = MMPI2BackPropagation.new_configured
net.train(tests,times)

ObjectDao.new(MMPI2_NET_FILE_NAME).save net
