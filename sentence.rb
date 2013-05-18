# encoding: utf-8

class Sentence
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	attr_reader :text
	attr_accessor :answer

	def answer_yes
		answer=1
	end

	def answer_yes
		answer=0
	end

	def to_s
		"|Afirmación: #{@text} #{"|Respuesta: #{answer_to_s}|" if was_answered}"
	end

	def was_answered
		!@answer.nil?
	end

	def answer_to_s
		if answer == 0 
			YES
		elsif answer == 1
			NO
		end
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_text)
		@text = a_text
	end
end