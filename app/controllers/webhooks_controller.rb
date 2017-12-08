class WebhooksController < ApplicationController
  def create
    text = params[:text]

    render json: { text: TrainReporter.report(text) }
  end
end
