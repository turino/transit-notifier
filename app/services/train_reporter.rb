class TrainReporter
  PARAMS = {
    north: %i[direction north],
    south: %i[direction south],
    red: %i[line red],
    yellow: %i[line yellow],
    blue: %i[line blue],
    green: %i[line green],
    macarthur: [:destination, BartApi::Destination::MACARTHUR_DESTINATIONS],
  }.freeze

  REPORT_NAMES = {
    when: :report_departures,
    delay: :report_delays,
  }.freeze

  def self.departures(params)
    new(params).departures
  end

  def self.report(params)
    new(params).report
  end

  def initialize(params)
    keywords = params.split(" ").map(&:to_sym)
    @command, @keywords = keywords
  end

  def departures
    BartApi::Station.new(:mont).where(*params).departure_times
  end

  def report
    text.presence || "What?"
  end

  private

  def text
    BartApi::Station.new(:mont).where(*params).send(report_name)
  end

  def report_name
    REPORT_NAMES[command]
  end

  def params
    PARAMS[keywords] || [:destination, keywords]
  end

  attr_reader :command, :keywords
end
