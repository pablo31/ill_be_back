# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ill_be_back/version'

Gem::Specification.new do |spec|
  spec.name          = "ill_be_back"
  spec.version       = IllBeBack::VERSION
  spec.authors       = ["pablo31"]
  spec.email         = ["psfutn@gmail.com"]
  spec.summary       = %q{Ill Be Back Short summary}
  spec.description   = %q{Ill Be Back Longer description}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'pry-byebug'
end
