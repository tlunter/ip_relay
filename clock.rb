lib = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'resque'
require 'clockwork'
require 'ip_relay'

module Clockwork
  handler { |job|
    Resque.enqueue(job)
  }

  every(1.hour, 'ip.refresh') do
    IpRelay.run
  end
end
