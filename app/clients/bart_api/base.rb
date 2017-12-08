module BartApi
  class Base
    KEY = "MW9S-E7SL-26DU-VV8V".freeze
    BASE_URL = "http://api.bart.gov/api/".freeze
    AUTH = "&key=#{KEY}".freeze

    def get_json(path)
      url = [BASE_URL, path, AUTH].join
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end
  end
end
