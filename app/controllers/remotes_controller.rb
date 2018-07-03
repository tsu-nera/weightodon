class RemotesController < ApplicationController
  protect_from_forgery

  def create
    user = User.find_by_token(:activate, params[:token])

    if user
      user.weights.create(value: params[:weight], date: Time.now)

      send_weightodon(user, params[:weight])

      render json: {status: :ok}
    else
      render json: {status: :bad_request}
    end
  end
end
