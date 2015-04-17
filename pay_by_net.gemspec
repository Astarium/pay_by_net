Gem::Specification.new do |s|
  s.name          = 'pay_by_net'
  s.version       = '0.0.0'
  s.date          = '2015-04-01'
  s.summary       = 'PayByNet Ruby Gem'
  s.description   = 'Gem creating information demended by PayByNet system'
  s.authors       = 'astarium, Małgorzata Ksionek'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.license       = 'MIT'

  s.add_dependency 'savon', '~> 2.3.0'
  s.add_dependency 'rest-client'
  s.add_development_dependency 'webmock' 
  s.add_development_dependency 'rake'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'minitest'
end
