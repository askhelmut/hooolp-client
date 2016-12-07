lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)
require "hoolp/version"

Gem::Specification.new do |spec|
  spec.name        = "hoolp-client"
  spec.version     = Hoolp::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ["Niels Hoffmann"]
  spec.email       = ["niels@askhelmut.com"]
  spec.homepage    = "https://www.askhelmut.com"
  spec.summary     = "A wrapper for the Hooolp API."
  spec.description = "Simple wrapper to request data form the Hooolp API."
  spec.license     = "MIT"

  spec.required_rubygems_version = ">= 1.3.5"

  spec.add_dependency("httparty", "~> 0.12")
  spec.add_dependency("hashie", "~> 2.0")

  spec.files        = Dir.glob("lib/**/*") + %w(README.md)
  spec.require_path = "lib"
end
