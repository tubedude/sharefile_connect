# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sharefile_connect/version'

Gem::Specification.new do |spec|
  spec.name          = "sharefile_connect"
  spec.version       = SharefileConnect::VERSION
  spec.authors       = ["tubedude"]
  spec.email         = ["rtrevisan@gmail.com"]

  spec.summary       = %q{Another Sharefile Ruby Wrapper}
  spec.description   = %q{This is a simple gem to allow any service to upload files to ShareFile as one single user. Please refer to ShareFile Api Documentation for more information.}
  spec.homepage      = "https://github.com/tubedude/sharefile_connect"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~>0.13'
  # spec.add_dependency 'httmultiparty'
  # spec.add_dependency 'oauth2'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.3.0'
  spec.add_development_dependency "dotenv", '~> 2.0.2'
  # spec.add_development_dependency "webmock"
  # spec.add_development_dependency "vcr"
end
