# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "navigator"
  spec.version = "7.4.0"
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://www.alchemists.io/projects/navigator"
  spec.summary = "Enhances Rails with a DSL for menu navigation."
  spec.license = "Hippocratic-2.1"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/navigator/issues",
    "changelog_uri" => "https://www.alchemists.io/projects/navigator/versions",
    "documentation_uri" => "https://www.alchemists.io/projects/navigator",
    "funding_uri" => "https://github.com/sponsors/bkuhlmann",
    "label" => "Navigator",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/bkuhlmann/navigator"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = "~> 3.1"
  spec.add_dependency "rails", "~> 7.0"
  spec.add_dependency "refinements", "~> 9.6"

  spec.files = Dir["*.gemspec", "app/**/*", "lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
end
