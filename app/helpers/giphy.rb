module Giphy

  def self.get_giphy(search_term)

    require 'uri'
    require 'net/http'

    url = URI("http://api.giphy.com/v1/gifs/search?q=funny+cat+#{search_term}&limit=40&api_key=dc6zaTOxFJmzC")
    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'ede4cb75-c622-d6c0-6903-86d7917ae90c'

    response = http.request(request)
     response.read_body
     response
  end

  def self.parse_giphy(response)
    data = JSON.parse(response.read_body)
    @giphy = data["data"]
    @giphys = []
    @giphy.each do |hash|
      @giphys << hash["images"]["fixed_height"]["url"]
    end
    @giphys
  end

end