class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    text = params[:text]

    render json: { text: TrainReporter.report(text) }
  end
end
