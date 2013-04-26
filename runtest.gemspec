# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'runtest/version'

Gem::Specification.new do |spec|
  spec.name          = "runtest"
  spec.version       = Runtest::VERSION
  spec.authors       = ["Tom Scott"]
  spec.email         = ["tubbo@psychedeli.ca"]
  spec.description   = %q{A singleton test runner for Minitest}
  spec.summary       = %q{A singleton test runner for Minitest}
  spec.homepage      = "http://github.com/tubbo/runtest"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "shoulda-context"
end
