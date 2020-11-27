# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "gir_ffi-gnome_keyring"
  s.version = "0.0.11"

  s.summary = "GirFFI-based binding to GnomeKeyring"
  s.description = "Bindings for GnomeKeyring generated by GirFFI, with overrides."
  s.required_ruby_version = ">= 2.4.0"

  s.license = "LGPL-2.1+"

  s.authors = ["Matijs van Zuijlen"]
  s.email = ["matijs@matijs.net"]
  s.homepage = "http://www.github.com/mvz/gir_ffi-gnome_keyring"

  s.rdoc_options = ["--main", "README.md"]

  s.files = Dir["{lib,test,tasks,examples}/**/*",
                "*.md",
                "Rakefile",
                "COPYING.lIB"] & `git ls-files -z`.split("\0")

  s.extra_rdoc_files = ["README.md", "Changelog.md"]
  s.test_files = `git ls-files -z -- test`.split("\0")

  s.add_runtime_dependency "gir_ffi", "~> 0.15.1"

  s.add_development_dependency "minitest", "~> 5.0"
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rubocop", "~> 1.4.2"
  s.add_development_dependency "rubocop-minitest", "~> 0.10.1"
  s.add_development_dependency "rubocop-performance", "~> 1.9.0"

  s.require_paths = ["lib"]
end
