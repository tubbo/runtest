require 'test_helper'
require 'runtest/command'

module Runtest
  class CommandTest < MiniTest::Unit
    subject { Command.new '' }

    test "throw an error when the example to run is blank" do
      assert_throws FileNotFound, subject
    end

    context "when running a full test file" do
      subject { Command.new "test/lib/runtest/command_test.rb" }

      should "run all examples in the file" do
        assert_equal "test/lib/runtest/command_test.rb", subject.file_name
      end

      should "resolve to a blank line number" do
        assert_equal 0, subject.line_number
      end
    end

    context "when specifying a line number in a test file" do
      subject { Command.new "test/lib/runtest/command_test.rb", 6 }

      should "find the file correctly" do
        assert_equal "test/lib/runtest/command_test.rb", command.file_name
      end

      should "resolve to the correct line number" do
        assert_equal 6, command.line_number
      end

      should "find the closest example to said line number" do
        assert_equal "run all examples in a test file", command.closest_example
      end
    end
  end
end
