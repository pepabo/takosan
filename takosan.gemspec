# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'takosan/version'

Gem::Specification.new do |spec|
  spec.name          = "takosan"
  spec.version       = Takosan::VERSION
  spec.authors       = ["OKUMURA Takahiro"]
  spec.email         = ["hfm.garden@gmail.com"]
  spec.summary       = %q{Ruby wrapper of Takosan}
  spec.description   = %q{Ruby wrapper of Takosan}
  spec.homepage      = "https://github.com/pepabo/takosan"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.0.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "mocha"
end
