module BartApi
  class Alert < Base
    PATH = "bsa.aspx?cmd=bsa".freeze

    def self.report
      all.map do |alert|
        [alert.station, alert.description].compact.join(": ")
      end.join("\n")
    end

    def self.all
      get_json(PATH)["root"]["bsa"].map { |alert| new(alert) }
    end

    def initialize(json)
      @json = json
    end

    def description
      json["description"]["#cdata-section"]
    end

    def station
      json["station"].presence
    end

    private

    attr_reader :json
  end
end
