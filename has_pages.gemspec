# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'has_pages/version'

Gem::Specification.new do |spec|
  spec.name          = "has_pages"
  spec.version       = HasPages::VERSION
  spec.authors       = ["Aaron Glenn"]
  spec.email         = ["aaron@aaronglenn.ca"]
  spec.summary       = %q{ Basic engine to allow for static pages to be rendered within Rails app. }
  spec.description   = %q{ Makes app/views/pages/ work like public/ but with layouts and all the Rails goodies. }
  spec.homepage      = "http://github.com/beautifulcode/has_pages"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
