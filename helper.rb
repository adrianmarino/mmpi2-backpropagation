require "rubygems"
require "yaml"
require "singleton"
require "ai4r"
require "./sentence"
require "./sentence_file_reader"
require "./mmpi2"
require "./mmpi2_factory"
require "./mmpi2_generator"
require "./object_yml_dao"
require "./mmpi2_back_propagation"
require "./binary_converter"
require "./mmpi2_back_propagation_result"

# ----------------------------------------------------------------------------
# Constants
# ----------------------------------------------------------------------------
SENTENCES_FILE_NAME = 'sentences'
MMPI2_DAO_FILE_NAME = 'mmpi2_trainning_tests.yml'
READ_ONLY='r'
WRITE_ONLY='w'
YES='Si'
NO='No'

# -------------------------------------------------------------------------
# Methods...
# -------------------------------------------------------------------------
def delete_dao_file
	File.delete MMPI2_DAO_FILE_NAME if File.exist? MMPI2_DAO_FILE_NAME
end
