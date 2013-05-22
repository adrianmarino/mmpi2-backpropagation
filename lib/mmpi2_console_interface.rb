# encoding: utf-8

class MMPI2ConsoleInterface
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def show_head
		puts "--------------"
		puts "| Test MMPI2 |"
		puts "--------------\n\n"
		puts "Responda las siguientes afirmaciones:\n\n"
	end

	def show_evaluating
		puts "Evaluando resultado..."
	end

	def show_result(result)
		puts "=> El nivel de depresion es: #{result.value}."
	end

	def answer_of(a_sentence)
		begin
			puts "#{@count}. #{a_sentence.text}. Responda: s/n"
			answer = gets.chomp
			if not_is_correct answer  
				puts "¡La opcion ingrasada es incorrecta!"
			end
		end while not_is_correct(answer)
		@count+=1
		answer
	end

	def not_is_correct(answer)
		answer != 's' and answer != 'n'
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize
		@count = 1
	end
end
