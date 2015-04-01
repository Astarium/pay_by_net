Gem::Specification.new do |s|
  s.name          = 'pay_by_net'
  s.version       = '0.0.0'
  s.date          = '2015-04-01'
  s.summary       = 'PayByNet Ruby Gem'
  s.description   = 'Gem creating information demended by PayByNet system'
  s.authors       = 'astarium'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.license       = 'MIT'
end