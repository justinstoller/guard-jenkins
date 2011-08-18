require File.expand_path( 'lib/guard/jenkins/version' )

Gem::Specification.new do |gem|
  gem.name                        = 'guard-jenkins'
  gem.version                     = Guard::JenkinsVersion::VERSION
  gem.author                      = 'Justin Stoller'
  gem.email                       = 'justin.stoller@gmail.com'
  gem.homepage                    = 'http://justinstoller.github.com/guard-jenkins'
  gem.summary                     = 'A simple guard script to place a failure image or success image
                                       after a build has finished in a
                                       consistent location for jenkins jobs.'
  gem.description                 = "Guard-Jenkins checks for the modification
                                       of the nextBuildNumber file in a job's
                                       directory and then creates a symlink
                                       from either fail.png or success.png
                                       to $JENKINS_HOME/userContent/jobs/JOB_NAME/current_status.png"

  gem.files                       = `git ls-files`.split("\n")
  gem.test_files                  = `git ls-files -- spec`.split("\n")
  gem.require_paths               = ['lib']

  gem.add_development_dependency    'rspec',      '~> 2.6'
  gem.add_development_dependency    'simplecov',  '~> 0.4'
  gem.add_development_dependency    'rake'

  gem.add_runtime_dependency        'guard',      '~> 0.6'
  gem.add_runtime_dependency        'nokogiri',   '~> 1.5'
end
