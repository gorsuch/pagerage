# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pagerage/version'

Gem::Specification.new do |gem|
  gem.name          = "pagerage"
  gem.version       = Pagerage::VERSION
  gem.authors       = ['Michael Gorsuch']
  gem.email         = ['michael.gorsuch@gmail.com']
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.add_development_dependency('foreman')
  gem.add_development_dependency('rack-test')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('timecop')
  gem.add_development_dependency('webmock')
  gem.add_dependency('haml')
  gem.add_dependency('pg')
  gem.add_dependency('rest-client')
  gem.add_dependency('sequel')
  gem.add_dependency('sinatra')
end
