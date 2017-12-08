module BartApi
  class Station < Base
    PATH = "etd.aspx?cmd=etd&orig=%s&json=y".freeze

    def initialize(name, trains = nil)
      @name = name
      @trains = trains || fetch_trains
    end

    def where(field, values)
      limit(trains.select { |line| Array(values).include? line.send(field) })
    end

    def find_by(field, value)
      trains.detect { |line| line.send(field) == value }
    end

    def destination(abbr)
      find_by(:abbreviation, abbr)
    end

    def report
      trains.map(&:report).join("\n")
    end

    def departure_times
      trains.flat_map(&:departure_times).sort
    end

    def departing_trains
      trains.flat_map(&:departing_trains).sort
    end

    private

    attr_reader :name, :trains

    def limit(trains)
      self.class.new(name, trains)
    end

    def fetch_trains
      path = PATH % name
      json = get_json(path)["root"]["station"].first["etd"]
      json.map { |destination| Destination.new(destination) }
    end
  end
end
