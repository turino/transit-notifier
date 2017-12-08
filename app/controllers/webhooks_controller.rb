class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    text = params[:text]
    report = BartApi::Station.new(:mont).destination(text.to_sym).report
    render json: { text: report }
  end
end
