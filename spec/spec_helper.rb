lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rspec'
require 'vcr'
require 'ip_relay'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.hook_into :excon
  c.cassette_library_dir = File.join(File.dirname(__FILE__), '..', 'vcr')
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.color_enabled = true
  config.formatter = :documentation
  config.tty = true
end
