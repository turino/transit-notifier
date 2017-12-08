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

    def direction
      json["direction"].downcase.to_sym
    end

    private

    attr_reader :json
  end
end
