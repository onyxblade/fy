# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fy/version'

Gem::Specification.new do |spec|
  spec.name          = "fy"
  spec.version       = Fy::VERSION
  spec.authors       = ["JIANG Di"]
  spec.email         = ["dd19941105@gmail.com"]
  spec.summary       = %q{A translate tool in your command line}
  spec.homepage      = "https://github.com/dd1994/fy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
