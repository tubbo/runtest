require "runtest/version"
require "runtest/command"

module Runtest
  # An exception thrown when the file passed in does not exist.
  class FileNotFound < StandardError; end
end
