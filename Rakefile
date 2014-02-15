lib = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rake'
require 'ip_relay'

require 'resque/tasks'
require 'rspec/core/rake_task'
require 'cane/rake_task'

task "resque:setup" do
    ENV['QUEUE'] = '*'
    ENV['TERM_CHILD'] = '1'
end

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" do
  Rake::Task["resque:setup"].invoke
  Rake::Task["resque:work"].invoke
end

task :default => [:spec, :quality]

RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

Cane::RakeTask.new(:quality) do |cane|
  cane.canefile = '.cane'
end
