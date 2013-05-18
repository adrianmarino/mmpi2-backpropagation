require "test/unit"
require "./helper"

class SentenceFileReaderText < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_read_all
		# Perform...
		sentences = @target.read_all

		# Asserts...
		assert_senteces_text sentences
	end

	def setup
		@target = SentenceFileReader.new SENTENCES_FILE_NAME
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def assert_senteces_text(sentences)
		counter = 0
		new_sentences_file.each_line do |a_line|
			text = a_line.strip
			assert_equal sentences[counter].text, text if !text.empty?
			counter += 1
		end
		assert counter > 0
	end

	def new_sentences_file
		File.open SENTENCES_FILE_NAME, READ_ONLY
	end
end