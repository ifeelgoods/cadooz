$:.push File.expand_path('../lib', __FILE__)

require 'cadooz/version'

Gem::Specification.new do |s|
  s.name          = 'cadooz'
  s.version       = Cadooz::VERSION
  s.authors       = ['Andrew Brown']
  s.email         = ['andrew@bonus.ly']
  s.homepage      = 'https://github.com/bonusly/cadooz'
  s.license       = 'MIT'
  s.summary       = 'Ruby Wrapper for cadooz SOAP API'
  s.description   = 'cadooz is a world leader in incentive marketing and distribution of digital rewards, including gift cards, e-vouchers, etc. This gem wraps cadooz\'s BusinessOrderService SOAP API (http://business.cadooz.com/api/businessorder/v1.5.2/com/cadooz/webservice/businessorder/v152/package-summary.html)'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'savon', '~> 2.11'
  s.add_dependency 'money', '~> 6.7'
  s.add_dependency 'google_currency', '~> 3.3'
  s.add_dependency 'activesupport', '~> 4.2'
  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'pry', '~> 0.9.12'
  s.add_development_dependency 'webmock', '~> 1.24'
  s.add_development_dependency 'rake'
end
