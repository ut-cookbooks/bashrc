#!/usr/bin/env rake

require "emeril/rake"

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:unit) do |t|
  t.rspec_opts = "--color --format documentation"
  t.pattern = ["test/unit/**/*_spec.rb"]
end

begin
  require "kitchen/rake_tasks"
  Kitchen::RakeTasks.new
rescue LoadError
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV["CI"]
end

desc "Run all test suites"
task :test => [:unit]

require "foodcritic"
FoodCritic::Rake::LintTask.new do |t|
  t.options = { :fail_tags => ["any"] }
end

require "finstyle"
require "rubocop/rake_task"
RuboCop::RakeTask.new(:style) do |task|
  task.options << "--display-cop-names"
end

desc "Run all quality tasks"
task :quality => [:foodcritic]

task :default => [:test, :quality]
