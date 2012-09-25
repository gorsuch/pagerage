require 'bundler/gem_tasks'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.ruby_opts = '-I .'
end

task :fetch do
  require 'pagerage'
  puts Pagerage::Incidentinator.new.run
end

task :default => :spec
