class DeparturesController < ApplicationController
  def index
    text = "when #{params[:keyword]}"

    render json: { estimates: TrainReporter.departures(text) }
  end
end
