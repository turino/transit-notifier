module BartApi
  class Destination
    MACARTHUR_DESTINATIONS = %i[pitt rich].freeze

    def initialize(json)
      @json = json
    end

    def delays
      departing_trains.map(&:second)
    end

    def departure_times
      departing_trains.map(&:first)
    end

    def departing_trains
      estimates.map do |est|
        [est.etd, est.delay, est.line, est.direction]
      end.sort
    end

    def destination
      json["abbreviation"].downcase.to_sym
    end

    def destination_name
      json["destination"]
    end

    def line
      estimates.first.line
    end

    def direction
      estimates.first.direction
    end

    def estimates
      json["estimate"].map { |train| Train.new(train) }
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
