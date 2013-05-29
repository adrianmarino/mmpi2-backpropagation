# ----------------------------------------------------------------------------
# Require
# ----------------------------------------------------------------------------
require 'rubygems'
require 'bundler/setup'
require "require_all"

require "yaml"
require "singleton"
require "ai4r"

require_all "#{ROOT_DIR}/lib"
require_all "#{ROOT_DIR}/config"

# ----------------------------------------------------------------------------
# Constants
# ----------------------------------------------------------------------------
READ_ONLY = 'r'
WRITE_ONLY = 'w'
YES = 'Si'
NO = 'No'

TMP_DIR = "#{ROOT_DIR}/tmp"
NET_FILE_NAME = "#{TMP_DIR}/net_trained.dat"
SENTENCES_FILE_NAME = "#{ROOT_DIR}/config/sentences"
LOGGER_PATH = "#{ROOT_DIR}/log"
LOGGER_FILE_NAME = "#{LOGGER_PATH}/mmpi2.log"

FileHelper.create_path TMP_DIR