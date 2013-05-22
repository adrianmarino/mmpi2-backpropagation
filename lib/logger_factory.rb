require "logger"

class LoggerFactory
	include Singleton

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	attr_reader :logger

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def create_log_dir
		FileHelper.create_path LOGGER_PATH
	end

	# ----------------------------------------------------------------------------
	# Initializer
	# ----------------------------------------------------------------------------
	def initialize
		create_log_dir
		@logger = Logger.new LOGGER_FILE_NAME
	end	
end