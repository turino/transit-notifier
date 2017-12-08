class TrainReporter
  PARAMS = {
    north: %i[direction north],
    south: %i[direction south],
    macarthur: [:destination, BartApi::Destination::MACARTHUR_DESTINATIONS],
  }.freeze

  def self.report(report_name)
    new(report_name).report
  end

  def initialize(params)
    keywords = params.split(" ")
    @report_name = keywords.last.to_sym
  end

  def report
    if report_name
      text.presence || "What does #{report_name} mean?"
    end
  end

  def text
    BartApi::Station.new(:mont).where(*params).report
  end

  private

  def params
    PARAMS[report_name] || [:destination, report_name]
  end

  attr_reader :report_name
end
