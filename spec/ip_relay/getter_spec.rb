require 'spec_helper'

describe IpRelay::Getter do
  context "#get_info" do
    it "returns the info hash", :vcr do
      expect(subject.get_info).to eq({
        :city => "Boston",
        :country => "US",
        :hostname => "c-24-61-23-195.hsd1.ma.comcast.net",
        :ip => "24.61.23.195",
        :loc => "42.3584,-71.0598",
        :org => "AS7922 Comcast Cable Communications, Inc.",
        :region => "Massachusetts"
      })
    end
  end

  context "#get_ip" do
    before do
      subject.stub(:get_info).and_return({
        :city => "Boston",
        :country => "US",
        :hostname => "c-24-61-23-195.hsd1.ma.comcast.net",
        :ip => "24.61.23.195",
        :loc => "42.3584,-71.0598",
        :org => "AS7922 Comcast Cable Communications, Inc.",
        :region => "Massachusetts"
      })
    end

    it "returns just the ip" do
      expect(subject.get_ip).to eq("24.61.23.195")
    end
  end
end
