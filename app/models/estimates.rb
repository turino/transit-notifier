class Estimates
	attr_reader :station_name, :timestamp
	attr_accessor :destinations

	def initialize(station_name, date, time)
		@station_name = station_name
		@timestamp = build_timestamp(date, time)
	end

	def build_timestamp(date, time)
		Time.parse("#{date} #{time}")
	end
end