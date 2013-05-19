require "rubygems"
require "yaml"
require "singleton"
require "ai4r"
require "../lib/sentence"
require "../lib/sentence_file_reader"
require "../lib/mmpi2"
require "../lib/mmpi2_factory"
require "../lib/mmpi2_generator"
require "../lib/object_yml_dao"
require "../lib/object_dao"
require "../config/net_configuration"
require "../lib/mmpi2_back_propagation"
require "../lib/binary_converter"
require "../lib/mmpi2_back_propagation_result"
require "../lib/file_utils"

require "../lib/net_output_converter"
require "../lib/output_converter"
require "../lib/output_by_number_converter"
require "../lib/binary_output_converter"

# ----------------------------------------------------------------------------
# Constants
# ----------------------------------------------------------------------------
SENTENCES_FILE_NAME = '../config/sentences'
DAO_FILE_NAME = 'trainning_tests.yml'
NET_FILE_NAME = 'net_trained.dat'
READ_ONLY='r'
WRITE_ONLY='w'
YES='Si'
NO='No'