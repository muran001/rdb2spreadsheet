# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdb2spreadsheet/version'

Gem::Specification.new do |spec|
  spec.name          = "rdb2spreadsheet"
  spec.version       = Rdb2spreadsheet::VERSION
  spec.authors       = ["muran001"]
  spec.email         = ["macmuran001@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  end

  spec.summary       = %q{Select rdb data and update spreadsheet using it.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'google_drive'
  spec.add_dependency 'activerecord'
  spec.add_dependency 'mysql2', '~> 0.3.13'
  spec.add_dependency 'pg'
  spec.add_dependency 'sqlite3'

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
