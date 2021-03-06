# -*- encoding: utf-8 -*-
require File.expand_path('../lib/warden-browserid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ringe"]
  gem.email         = ["runar@rin.no"]
  gem.description   = %q{Warden BrowserID strategy - DISCONTINUED}
  gem.summary       = %q{Authenticate your Warden-enabled app using BrowserID from Mozilla}
  gem.homepage      = "https://github.com/ringe/warden-browserid"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "warden-browserid"
  gem.require_paths = ["lib"]
  gem.version       = Warden::BrowserId::VERSION

  gem.add_dependency "warden"
  gem.add_dependency "rake"
end
