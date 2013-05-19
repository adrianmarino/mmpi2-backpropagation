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
require "./object_dao"
require "./net_configuration"
require "./mmpi2_back_propagation"
require "./binary_converter"
require "./mmpi2_back_propagation_result"
require "./file_utils"

# ----------------------------------------------------------------------------
# Constants
# ----------------------------------------------------------------------------
SENTENCES_FILE_NAME = 'sentences'
DAO_FILE_NAME = 'trainning_tests.yml'
NET_FILE_NAME = 'net_trained.dat'
READ_ONLY='r'
WRITE_ONLY='w'
YES='Si'
NO='No'
