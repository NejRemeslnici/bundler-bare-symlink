
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bundler/bare_symlink/version"

Gem::Specification.new do |spec|
  spec.name = "bundler-bare_symlink"
  spec.version = Bundler::BareSymlink::VERSION
  spec.authors = ["Pete Kinnecom", "Matouš Borák"]
  spec.email = ["git@k7u7.com"]
  spec.licenses = ["WTFPL"]

  spec.summary = "Post-install hook for bundler to create symlinks all gems from a local directory, using just bare gem names without versions"
  spec.homepage = "https://github.com/NejRemeslnici/bundler-bare-symlink"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files = [
    "bundler-bare_symlink.gemspec",
    "plugins.rb",
    "lib/bundler/bare_symlink.rb",
    "lib/bundler/bare_symlink/version.rb"
  ]
  spec.bindir = "exe"
  spec.executables = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.0"
  spec.add_runtime_dependency "bundler", "~> 2.0"
end
