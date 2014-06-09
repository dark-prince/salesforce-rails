# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'salesforce/rails/version'

rails_version = ['>= 3.1.0', '< 4.0']
Gem::Specification.new do |spec|
  spec.name          = "salesforce-rails"
  spec.version       = Salesforce::Rails::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Diganta Mandal"]
  spec.email         = ["diganta@emerchantpay.com"]
  spec.summary       = %q{Convenience classes to make using the salesforce calender events with Rails apps even easier.}
  spec.description   = %q{Convenience classes to make using the salesforce calender events with Rails apps even easier.}
  spec.homepage      = "https://github.com/dark-prince/salesforce-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "databasedotcom", "~> 1.3.0"
  spec.add_dependency "railties", rails_version
  spec.add_dependency "actionpack", rails_version
  spec.add_dependency "thor", ">= 0.14", "< 2.0"
  
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "rails", rails_version
end