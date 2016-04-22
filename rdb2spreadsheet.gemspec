# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdb2spreadsheet/version'

Gem::Specification.new do |spec|
  spec.name          = 'rdb2spreadsheet'
  spec.version       = Rdb2spreadsheet::VERSION
  spec.authors       = ['muran001']
  spec.email         = ['macmuran001@gmail.com']

  spec.summary       = %q{A library to select rdb data and update spreadsheet using it.}
  spec.description   = %q{A library to select rdb data and update spreadsheet using it.}
  spec.homepage      = 'https://github.com/muran001/rdb2spreadsheet'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'google_drive', '~> 1.0'
  spec.add_dependency 'activerecord', '~> 4.2'
  spec.add_dependency 'mysql2', '~> 0.3.20'
  spec.add_dependency 'pg', '~> 0.18'
  spec.add_dependency 'sqlite3', '~> 1.3'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
end
