class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @weight = current_user.weights.build
    end
  end
end
