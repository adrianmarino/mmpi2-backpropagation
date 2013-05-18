class MMPI2
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	attr_reader :sentences, :depression_level

	def calculate_results
		reset_depression_level

		# Column 1...
		inc_depression_level if @sentences[0].answer_no?
		inc_depression_level if @sentences[1].answer_yes?
		inc_depression_level if @sentences[2].answer_no?
		inc_depression_level if @sentences[3].answer_no?
		inc_depression_level if @sentences[4].answer_yes?
		inc_depression_level if @sentences[5].answer_yes?
		inc_depression_level if @sentences[6].answer_no?
		inc_depression_level if @sentences[7].answer_no?

		# Column 2...
		inc_depression_level if @sentences[8].answer_yes?
		inc_depression_level if @sentences[9].answer_no?
		inc_depression_level if @sentences[10].answer_no?
		inc_depression_level if @sentences[11].answer_yes?
		inc_depression_level if @sentences[12].answer_yes?
		inc_depression_level if @sentences[13].answer_no?
		inc_depression_level if @sentences[14].answer_no?
		inc_depression_level if @sentences[15].answer_yes?
		inc_depression_level if @sentences[16].answer_no?
		inc_depression_level if @sentences[17].answer_no?
		inc_depression_level if @sentences[18].answer_yes?

		# Column 3...
		inc_depression_level if @sentences[19].answer_no?
		inc_depression_level if @sentences[20].answer_yes?

		# Column 4...
		inc_depression_level if @sentences[21].answer_yes?
		inc_depression_level if @sentences[22].answer_yes?

		# Column 5...
		inc_depression_level if @sentences[23].answer_yes?
		inc_depression_level if @sentences[24].answer_yes?
		inc_depression_level if @sentences[25].answer_yes?
		inc_depression_level if @sentences[26].answer_yes?

		# Column 6...
		inc_depression_level if @sentences[27].answer_yes
		inc_depression_level if @sentences[28].answer_yes

		# Column 7...
		inc_depression_level if @sentences[29].answer_yes

		# Column 8...
		inc_depression_level if @sentences[30].answer_yes
		inc_depression_level if @sentences[31].answer_yes
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
		"Depresion level: #{@depression_level}"
	end

	def answers_array
		@sentences.collect {|a_sentence|a_sentence.answer}
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def reset_depression_level
		@depression_level = 0
	end

	def inc_depression_level
		@depression_level+=1
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(sentences)
		@sentences = sentences
		reset_depression_level
	end
end