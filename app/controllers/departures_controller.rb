class DeparturesController < ApplicationController
  def index
    text = "when #{params[:keyword]}"
    departures = TrainReporter.departures(text)
    next_train = departures.detect { |etd| etd > 4 }
    color = case next_train
            when 9..11
              1
            when 6..8
              2
            when 5
              3
            else
              0
            end
    render json: color
    # render json: { estimates: TrainReporter.departures(text) }
  end
end
