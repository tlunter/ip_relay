# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ip_relay/version'

Gem::Specification.new do |spec|
  spec.name          = "ip_relay"
  spec.version       = IpRelay::VERSION
  spec.authors       = ["Todd Lunter"]
  spec.email         = ["tlunter@gmail.com"]
  spec.description   = %q{Updates local IP info on remote computer}
  spec.summary       = %q{Updates local IP info on remote computer}
  spec.homepage      = "https://github.com/tlunter/ip_relay"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "clockwork"
  spec.add_dependency "daemons"
  spec.add_dependency "excon"
  spec.add_dependency "foreman"
  spec.add_dependency 'net-ssh'
  spec.add_dependency 'net-scp'
  spec.add_dependency "resque"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "cane"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
end
