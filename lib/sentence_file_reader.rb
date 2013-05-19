class SentenceFileReader
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def read_all
		open
		sentences = []
		@input.each_line do |a_text|
			text = a_text.strip
		  sentences.push Sentence.new(text) if !text.empty?
		end
		close
		sentences
	end

	def open
		@input = File.open @path, READ_ONLY
	end

	def close
		@input.close
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_path)
		@path = a_path			
	end
end