class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @weights = current_user.weights.page(params[:page])
      @profile = current_user.profile
    end
  end
end
