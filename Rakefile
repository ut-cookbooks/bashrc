#!/usr/bin/env rake

require 'foodcritic'

FoodCritic::Rake::LintTask.new do |t|
  t.options = { :fail_tags => ['any'] }
end

task :default => [:foodcritic]

begin
  require 'jamie/rake_tasks'
  Jamie::RakeTasks.new
rescue LoadError
  puts ">>>>> Jamie gem not loaded, omitting tasks" unless ENV['CI']
end
