# Runtest

A little Ruby library that helps you run single tests files using
Test::Unit (or Minitest). It allows running single examples by line
number as well as full files. Runtest uses `bundle exec ruby -Itest` as
its test run command.

## Installation

Add the gem to your `:development` group, as it will only be run on
development servers:

    group :development do
      gem 'runtest', require: false # no need to require it since it
                                    # isn't part of the app or testing
                                    # framework..
    end

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install runtest

## Usage

Just pass a test file into the `rtest` binary:

    $ rtest test/unit/my_model_test.rb

Or, you can run a single example in the file:

    $ rtest test/unit/my_model_test.rb:45

Line 45 must include an example, like `test "blah blah" do`. Runtest
will also work flawlessly with `shoulda_context` and `minitest`
variations on this syntax. It does *not* work with Minitest's spec
syntax just yet..

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
