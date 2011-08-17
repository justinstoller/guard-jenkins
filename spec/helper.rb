$:.unshift( File.expand_path( '..', __FILE__ ) )
$:.unshift( File.expand_path( '../../lib', __FILE__ ) )
require 'rspec'
require 'simplecov'
SimpleCov.start

require 'jenkins_status_banner_guard'
