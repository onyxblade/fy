# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fy/version"

Gem::Specification.new do |spec|
  spec.name                  = 'fy'
  spec.version               = Fy::VERSION
  spec.authors               = ["JIANG Di"]
  spec.email                 = ["dd19941105@gmail.com"]
  spec.summary               = %q{A translate tool in your command line}
  spec.homepage              = "https://github.com/dd1994/fy"
  spec.license               = "MIT"
  spec.required_ruby_version = ">=1.9.3"
  spec.has_rdoc              = false
  spec.files                 = `git ls-files -z`.split("\x0")
  spec.executables           = ["fy"]
  spec.test_files            = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths         = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "rainbow", ">= 2.0.0"
end
