#!/usr/bin/env ruby
require './libs'

# Parameters...
tests_count = ARGV[0].to_i

puts "Generate #{tests_count} random tests..."
tests = MMPI2Generator.instance.generate tests_count

net = MMPI2BackPropagation.new_configured
puts "Training net..."
net.train tests

test = MMPI2Generator.instance.generate.first
puts "Test Depression Level: #{test.depression_level}" 

puts "Eval test on net..."
result = net.results_of test

puts result