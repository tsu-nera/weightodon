class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @weights = current_user.weights.page(params[:page])
      @profile = current_user.profile
      gon.graph_weights = current_user.weights.pluck(:value)
      gon.graph_date = current_user.weightsa.pluck(:date).map{|date| date.strftime("%m/%d")}
    else
      @profiles = Profile.where(public: "公開").order("updated_at DESC").limit(10)
    end
  end

  def show
    @user = User.find(params[:id])
    @weights = @user.weights.page(params[:page])
    @profile = @user.profile
    gon.graph_weights = @user.weights.pluck(:value)
    gon.graph_date = @user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}
  end
end
