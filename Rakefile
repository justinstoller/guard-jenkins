#!/usr/bin/env rake
require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
Rspec::Core::RakeTask.new(:spec)

task :default => :spec
task :test => :spec
