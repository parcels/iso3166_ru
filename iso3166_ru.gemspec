# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iso3166_ru/version'

Gem::Specification.new do |spec|
  spec.name          = "iso3166_ru"
  spec.version       = Iso3166Ru::VERSION
  spec.authors       = ["Artem Shitov"]
  spec.email         = ["inbox@artemshitov.ru"]
  spec.description   = %q{Lets you find country names in English and Russian, based on country codes (and vice versa)}
  spec.summary       = %q{ISO 3166-1 country list in English and Russian}
  spec.homepage      = "https://github.com/artemshitov/iso3166_ru"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', '~> 5.0.6'
end
