# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aiwolf/version'

Gem::Specification.new do |spec|
  spec.name          = 'aiwolf-client'
  spec.version       = Aiwolf::VERSION
  spec.authors       = ['Tei1988']
  spec.email         = ['github@grifola.xyz']

  spec.summary       = 'Aiwolf 4.x Client Library for Ruby'
  spec.description   = 'This gem is useful for building Aiwolf 4.x Client.'
  spec.homepage      = 'https://github.com/Tei1988/aiwolf-client-ruby'
  spec.license       = 'MIT'

  unless spec.respond_to?(:metadata)
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'eventmachine'
  spec.add_dependency 'thor'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'simplecov'
end
