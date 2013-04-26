module Runtest
  class Command
    SYNTAX = /^(test|should)\s(\"|\')|(\"|\')\sdo$/
    attr_accessor :file_name, :line_number, :options

    def initialize argument
      arguments = argument.split ':'
      @file_name =  arguments[0] || ""
      @line_number = arguments[1].to_i || 0
      @base_command = "bundle exec ruby -Itest"

      raise FileNotFound unless File.exists? file_name
    end

    def perform!
      if line_number <= 0
        run_test
      else
        run_test "-n '#{closest_example}'"
      end
    end

    def closest_example
      line_at_line_number.gsub SYNTAX, ''
    end

    def file_name
      "#{@file_name}".strip
    end

    def line_number
      if @line_number <= 0
        0
      else
        @line_number.to_i - 1
      end
    end

    def base_command
      @base_command ||= "ruby -Itest"
    end

    def line_at_line_number
      file_contents[line_number].strip
    end

    def file_contents
      File.read(file_name).split "\n"
    end

    def run_test options=""
      @options = options
      system consolidated_command
    end

    def consolidated_command
      [ base_command, file_name, options ].join ' '
    end
  end
end
