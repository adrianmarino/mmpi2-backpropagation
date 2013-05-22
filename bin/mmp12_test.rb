#!/usr/bin/env ruby
require './helper'

# new user interface...
interface = MMPI2ConsoleInterface.new
interface.show_head

# new test...
test = MMPI2Factory.instance.new_test

# answer sentences...
test.sentences.each { |a_sentence|
	answer = interface.answer_of a_sentence
	a_sentence.answer_yes if answer == 's'
	a_sentence.answer_no if answer == 'n'
}

# Load trained net...
net = ObjectDao.new(NET_FILE_NAME).load

# Evaluate sentences on net...
interface.show_evaluating
result = net.results_of test

# Show results...
interface.show_result result