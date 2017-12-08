module BartApi
  class Base
    KEY = "MW9S-E7SL-26DU-VV8V".freeze
    BASE_URL = "http://api.bart.gov/api/".freeze
    AUTH = "&key=#{KEY}".freeze
    REQUEST_JSON = "&json=y".freeze

    def self.get_json(path)
      url = [BASE_URL, path, AUTH, REQUEST_JSON].join
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def get_json(path)
      self.class.get_json(path)
    end
  end
end
