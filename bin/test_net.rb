#!/usr/bin/env ruby
require './libs'

net = ObjectDao.new(NET_FILE_NAME).load

test = MMPI2Generator.instance.generate.first

puts "Test Depression Level: #{test.depression_level}" 

puts "Eval test on net..."
result = net.results_of test

puts result