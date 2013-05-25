require 'rubygems'
require 'bundler/setup'
require "require_all"

require "yaml"
require "singleton"
require "ai4r"

require_all 'lib'
require_all 'config'

# ----------------------------------------------------------------------------
# Constants
# ----------------------------------------------------------------------------
SENTENCES_FILE_NAME = './config/sentences'
NET_FILE_NAME = 'net_trained.dat'
READ_ONLY='r'
WRITE_ONLY='w'
YES='Si'
NO='No'
LOGGER_PATH="./log"
LOGGER_FILE_NAME="#{LOGGER_PATH}/mmpi2.log"
