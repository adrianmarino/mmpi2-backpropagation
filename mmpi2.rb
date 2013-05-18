class MMPI2
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	attr_reader :sentences

	def depression_level
	
	end

	def answer_yes_for_all_sentences
		@sentences.each {|a_sentence|a_sentence.answer_yes}
	end

	def answer_no_for_all_sentences
		@sentences.each {|a_sentence|a_sentence.answer_no}
	end

	def has_sentences
		!@sentences.empty?
	end

	def was_completed
		@sentences.all? do |a_sentence|  a_sentence.was_answered end	
	end

	def to_s
		count = 0
		@sentences.inject("") {| a_value, a_sentence | 
			count+=1
			"#{a_value}\n|#{count}#{a_sentence}"
		}
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(sentences)
		@sentences = sentences
	end
end