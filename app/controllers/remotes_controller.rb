class RemotesController < ApplicationController
  protect_from_forgery

  def create
    @weights = User.find(params[:id]).weights.new(value: params[:weight], date: Time.now)
    @weights.save

    render json: {status: :ok}
  end
end
