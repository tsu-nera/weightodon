class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @weights = current_user.weights.page(params[:page])
      @profile = current_user.profile

      if params[:duration] == "all"
        @graph_weights = current_user.weights.pluck(:value)
        @graph_date = current_user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}
      elsif params[:duration] == "3month"
        @graph_weights = current_user.weights.pluck(:value).take(90)
        @graph_date = current_user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}.take(90)
      elsif params[:duration] == "month"
        @graph_weights = current_user.weights.pluck(:value).take(30)
        @graph_date = current_user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}.take(30)
      else
        @graph_weights = current_user.weights.pluck(:value).take(7)
        @graph_date = current_user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}.take(7)
      end
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
