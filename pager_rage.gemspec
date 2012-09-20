# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pager_rage/version'

Gem::Specification.new do |gem|
  gem.name          = "pager_rage"
  gem.version       = PagerRage::VERSION
  gem.authors       = ['Michael Gorsuch']
  gem.email         = ['michael.gorsuch@gmail.com']
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_dependency('pg')
  gem.add_dependency('sequel')
end
