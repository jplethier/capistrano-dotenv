# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/dotenv/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-dotenv'
  spec.version       = Capistrano::Dotenv::VERSION
  spec.authors       = ['João Paulo Lethier']
  spec.email         = ['jplethier@gmail.com']
  spec.description   = %q{Dotenv tasks for capistrano deployment}
  spec.summary       = %q{Dotenv tasks for capistrano deployment}
  spec.homepage      = 'https://github.com/jplethier/capistrano-dotenv'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano',         '>= 3.5.0', '< 4.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
