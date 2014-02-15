require 'yaml'

# Loads a configuration file
class IpRelay::Config
  attr_accessor :config
  attr_writer :file

  def file
    @file ||= "ip_relay.yml"
  end

  def load
    self.config = YAML.load_file(file)
  end
end
