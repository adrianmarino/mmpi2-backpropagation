require './helper'

net = ObjectDao.new(MMPI2_NET_FILE_NAME).load

test = MMPI2Generator.instance.generate.first
test.answer_yes_for_all_sentences

result = net.results_of test

puts result