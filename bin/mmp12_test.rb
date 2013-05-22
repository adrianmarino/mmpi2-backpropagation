#!/usr/bin/env ruby
require './helper'

puts "--------------"
puts "| Test MMPI2 |"
puts "--------------\n\n"
puts "Responda las siguientes afirmaciones:\n\n"

test = MMPI2Factory.instance.new_test

count = 1
test.sentences.each { |a_sentence|
	puts "#{count}. #{a_sentence.text}. Responda: s/n"
	response = gets.chomp
	a_sentence.answer_yes if response == 's'
	a_sentence.answer_no if response == 'n'
	count+=1
}

net = ObjectDao.new(NET_FILE_NAME).load

puts "Eval test on net..."
result = net.results_of test

puts result