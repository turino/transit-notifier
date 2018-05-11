module BartApi
  class Destination
    MACARTHUR_DESTINATIONS = %i[pitt rich].freeze

    def initialize(json)
      @json = json
    end

    def delays
      estimates.map(&:delay_in_minutes)
    end

    def departure_times
      estimates.map(&:etd_with_delay)
    end

    def destination
      json["abbreviation"].downcase.to_sym
    end

    def destination_name
      json["destination"]
    end

    def direction
      estimates.first.direction
    end

    def estimates
      json["estimate"].map { |train| Train.new(train) }.sort_by(&:etd)
    end

    def report_delays
      "%s: %s" % [destination_name, delays.join(", ")]
    end

    def report_departures
      "%s: %s" % [destination_name, departure_times.join(", ")]
    end

    private

    attr_reader :json
  end
end
