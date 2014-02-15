require 'excon'
require 'json'
require 'ip_relay/version'

# Main module and run class
module IpRelay
  autoload :Config, 'ip_relay/config'
  autoload :Getter, 'ip_relay/getter'
  autoload :Sender, 'ip_relay/sender'

  def self.run
    config = IpRelay::Config.new
    getter = IpRelay::Getter.new
    sender = IpRelay::Sender.new

    config.load

    getter.url = config.config['url']
    sender.host = config.config['host']
    sender.username = config.config['username']
    sender.password = config.config['password']
    sender.path = config.config['path']

    ip = getter.get_ip
    sender.upload(ip)
  end
end
