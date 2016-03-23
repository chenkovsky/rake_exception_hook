Gem::Specification.new do |s|
  s.name        = 'rake_aws'
  s.version     = '3.13'
  s.date        = '2015-03-21'
  s.summary     = "aws/hadoop rake helper"
  s.description = "make rake run on aws and hadoop painlessly."
  s.authors     = ["Chenkovsky.chen"]
  s.email       = 'chenkov@yeah.net'
  s.files       = ["lib/aws.rb","lib/enter_exit_hook.rb"]
  s.homepage    =
    'https://github.com/chenkovsky/rake_aws'
  s.license       = 'MIT'
  s.add_dependency 'webhdfs'
  s.add_dependency 'rake-hooks'
end