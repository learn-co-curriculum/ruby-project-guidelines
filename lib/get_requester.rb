require 'open-uri'
require 'net/http'
require 'json'

class GetRequester
  def initialize(url)
    @url = url
  end

  def get_response_body
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_json
    JSON.parse(self.get_response_body)
  end
end