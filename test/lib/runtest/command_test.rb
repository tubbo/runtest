require 'test_helper'
require 'runtest/command'

module Runtest
  class CommandTest < Test::Unit::TestCase
    should "throw an error when the example to run is blank" do
      assert_raises FileNotFound do
        @command = Command.new "not/a/real/file.rb"
      end
    end

    context "when running a full test file" do
      setup { @command = Command.new "test/lib/runtest/command_test.rb" }

      should "run all examples in the file" do
        assert_equal "test/lib/runtest/command_test.rb", @command.file_name
      end

      should "resolve to a blank line number" do
        assert_equal 0, @command.line_number
      end
    end

    context "when specifying a line number in a test file" do
      setup { @command = Command.new "test/lib/runtest/command_test.rb:15" }

      should "find the file correctly" do
        assert_equal "test/lib/runtest/command_test.rb", @command.file_name
      end

      should "resolve to the correct line number" do
        assert_equal 14, @command.line_number
      end

      should "find the closest example to said line number" do
        assert_equal "run all examples in the file", @command.closest_example
      end
    end
  end
end
