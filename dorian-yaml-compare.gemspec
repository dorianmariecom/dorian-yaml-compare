# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "dorian-yaml-compare"
  s.version = "0.3.0"
  s.summary =
    "Compares keys of two YAML files, typically locales files in a Ruby on Rails application"
  s.description =
    s.summary +
      "\n\n" \
        "e.g. `yaml-compare config/locales/en.yml config/locales/fr.yml en fr`"
  s.authors = ["Dorian Marié"]
  s.email = "dorian@dorianmarie.fr"
  s.files = ["lib/dorian/yaml/compare.rb"]
  s.executables << "yaml-compare"
  s.homepage = "https://github.com/dorianmariecom/yaml-compare"
  s.license = "MIT"
  s.metadata = { "rubygems_mfa_required" => "true" }
end
