# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'readability_parser/version'

Gem::Specification.new do |gem|
  gem.name          = "readability_parser"
  gem.version       = ReadabilityParser::VERSION
  gem.authors       = ["Philippe Dionne"]
  gem.email         = ["dionne.phil@gmail.com"]
  gem.description   = %q{A tiny ruby wrapper for Readability's content parser api}
  gem.summary       = %q{Interact with the article parsing featureset of Readability. This means grabbing an article's content based on a URL.}
  gem.homepage      = "https://github.com/phildionne/readability_parser"
  gem.licenses      = []

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday", "~> 0.8.4"
  gem.add_dependency "faraday_middleware", "~> 0.9.0"
  gem.add_dependency "hashie", "~> 1.2.0"
  gem.add_dependency "multi_xml", "~> 0.5.2"

  gem.add_development_dependency "rspec"
end
