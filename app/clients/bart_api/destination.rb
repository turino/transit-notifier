module BartApi
  class Destination
    MACARTHUR_DESTINATIONS = %w[RICH PITT].freeze

    def initialize(json)
      @json = json
    end

    def departure_times
      departing_trains.map { |info| "#{info.first} (#{info.second} min delay)" }
    end

    def departing_trains
      estimates.map do |est|
        [est.etd, est.delay, est.line, est.direction]
      end.sort
    end

    def destination
      json["destination"]
    end

    def line
      estimates.first.line
    end

    def direction
      estimates.first.direction
    end

    def abbreviation
      json["abbreviation"].downcase.to_sym
    end

    def estimates
      json["estimate"].map { |train| Train.new(train) }
    end

    def report
      "%s: %s" % [destination, departure_times.join(", ")]
    end

    private

    attr_reader :json
  end
end
