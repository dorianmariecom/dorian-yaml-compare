# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "dorian-yaml-compare"
  s.version = "0.4.2"
  s.summary = "compares yaml files"
  s.description = s.summary
  s.authors = ["Dorian Marié"]
  s.email = "dorian@dorianmarie.com"
  s.files = ["bin/yaml-compare"]
  s.executables << "yaml-compare"
  s.homepage = "https://github.com/dorianmariecom/dorian-yaml-compare"
  s.license = "MIT"
  s.metadata = { "rubygems_mfa_required" => "true" }
  s.add_dependency "yaml"
  s.add_dependency "dorian-arguments"
end
