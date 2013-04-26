module Runtest
  class Command
    SYNTAX = /^(test|should)\s(\"|\')|(\"|\')\sdo$/
    attr_accessor :file_name, :line_number

    def initialize argument
      arguments = argument.split ':'
      @file_name =  arguments[0] || ""
      @line_number = arguments[1].to_i || 0
    end

    def perform!
      if line_number.zero?
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
      @line_number.to_i - 1
    end

  protected
    def line_at_line_number
      file_contents[line_number].strip
    end

    def file_contents
      File.read(file_name).split "\n"
    end

  private
    def run_test options=""
      system "bundle exec ruby -Itest #{file_name} #{options}"
    end
  end
end
