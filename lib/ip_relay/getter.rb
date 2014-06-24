# Gets the information from IP info
class IpRelay::Getter
  attr_writer :url

  def url
    @url ||= 'http://ipinfo.io/json'
  end

  def get_info
    JSON.parse(Excon.get(url).body, :symbolize_names => true)
  end

  def get_ip
    get_info[:ip]
  end
end
