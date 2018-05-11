module BartApi
  class Train
    def initialize(json)
      @json = json
    end

    def etd
      json["minutes"].to_i
    end

    def line
      json["color"].downcase.to_sym
    end

    def delay
      json["delay"].to_i
    end

    def delay_in_minutes
      delay / 60
    end

    def direction
      json["direction"].downcase.to_sym
    end

    def delay_text
      return "" if delay_in_minutes <= 0
      " (#{delay_in_minutes} min delay)"
    end

    def etd_with_delay
      "#{etd}#{delay_text}"
    end

    private

    attr_reader :json
  end
end
