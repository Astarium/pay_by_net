# encoding: utf-8
require File.expand_path('../lib/pay_by_net/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'pay_by_net'
  s.version       =  PayByNet::VERSION
  s.date          = '2016-08-08'
  s.summary       = 'Ruby interface for PayByNet payment system'

  s.description   = "Pay_by_net is framewrok agnostic Ruby interface for PayByNet payment system. Provides classes for creating payment's hashtrans, veryfing PayByNet responses and getting list of available banks. It can operate in production or test mode."
  s.license       = 'MIT'
  s.homepage      = 'https://github.com/Astarium/pay_by_net'
  s.email         = ['gosia@astarium.pl', 'aleks@astarium.pl']
  s.authors       = ['Małgorzata Ksionek', 'Aleksander Dąbrowski']

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency 'savon', '~> 2.3'
  s.add_dependency 'rest-client'
  s.add_development_dependency 'rake', '~> 13'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'timecop', '~> 0'
  s.add_development_dependency 'webmock', '~> 1'
end
