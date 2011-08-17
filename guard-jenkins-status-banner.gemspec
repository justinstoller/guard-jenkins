require File.expand_path( 'lib/guard/jenkins-status-banner/version' )

Gem::Specification.new do |gem|
  gem.name                        = 'guard-jenkins-status-banner'
  gem.version                     = Guard::JenkinsStatusBannerVersion::VERSION
  gem.author                      = 'Justin Stoller'
  gem.email                       = 'justin.stoller@gmail.com'
  gem.homepage                    = 'http://justinstoller.github.com/jenkins_status_banner_guard'
  gem.summary                     = 'a very short optional summary of jenkins_status_banner_guard'
  gem.description                 = 'a longer required description of what jenkins_status_banner_guard does'

  gem.files                       = `git ls-files`.split("\n")
  gem.test_files                  = `git ls-files -- spec`.split("\n")
  gem.require_paths               = ['lib']

  gem.add_development_dependency    'rspec',      '~> 2.6'
  gem.add_development_dependency    'simplecov',  '~> 0.4'
  gem.add_development_dependency    'rake'

  gem.add_runtime_dependency        'guard'
  gem.add_runtime_dependency        'nokogiri'
end
