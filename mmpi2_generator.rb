require "./helper"

class MMPI2Generator
	include Singleton

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def generate(a_number_of_tests = 1)
		tests = []
		a_number_of_tests.times do
			 test = answer(new_test)
			 test.calculate_results
			 tests.push test
		end
		tests
	end

	def new_test
		MMPI2Factory.instance.new_test
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def answer(a_test)		
		a_test.sentences.each do |a_sentence|
			a_sentence.answer = rand 0..1
		end
		a_test
	end
end

