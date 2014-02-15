require 'net/scp'

# Sends the IP data to the remote server
class IpRelay::Sender
  attr_accessor :host, :username, :password, :path

  def upload(data)
    Net::SCP.start(host, username, :password => password) do |scp|
      scp.upload! StringIO.new(data), path
    end
  end
end
