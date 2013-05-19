require './helper'

# Parameneters...
tests_count = ARGV[0].to_i

puts "Generate #{tests_count} random tests..."
tests = MMPI2Generator.instance.generate tests_count


net = MMPI2BackPropagation.new_configured
puts "Training net..."
net.train(tests)

ObjectDao.new(NET_FILE_NAME).save net
