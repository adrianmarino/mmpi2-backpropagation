require "rubygems"
require "yaml"
require "singleton"
require "ai4r"
require "../lib/logger_factory"
require "../lib/sentence"
require "../lib/sentence_file_reader"
require "../lib/mmpi2"
require "../lib/mmpi2_factory"
require "../lib/mmpi2_generator"
require "../lib/default_serializer"
require "../lib/yml_serializer"
require "../lib/object_dao"
require "../config/net_configuration"
require "../lib/mmpi2_back_propagation"
require "../lib/binary_converter"
require "../lib/mmpi2_back_propagation_result"
require "../lib/back_propagation_logger"
require "../lib/file_helper"
require "../lib/net_output_converter"
require "../lib/output_converter"
require "../lib/output_by_number_converter"
require "../lib/binary_output_converter"
require "../lib/mmpi2_console_interface"

# ----------------------------------------------------------------------------
# Constants
# ----------------------------------------------------------------------------
SENTENCES_FILE_NAME = '../config/sentences'
NET_FILE_NAME = 'net_trained.dat'
READ_ONLY='r'
WRITE_ONLY='w'
YES='Si'
NO='No'
LOGGER_PATH="../log"
LOGGER_FILE_NAME="#{LOGGER_PATH}/mmpi2.log"