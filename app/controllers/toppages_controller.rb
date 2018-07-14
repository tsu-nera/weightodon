class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @weights = current_user.weights.page(params[:page]).per(14)
      @profile = current_user.profile

      if mastodon_connected?(current_user)
        @weightodon = current_user.weightodon
        @account = valid_account?(@weightodon.access_token)
      end

      if @weights.first
        @latest_weight = @latest_weight.value
      else
        @latest_weight = @profile.start_weight
      end

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

      @graph_weights.reverse!
      @graph_date.reverse!
    else
      @welcome = true
      @profiles = Profile.where(public: "公開").order("updated_at DESC").limit(3)
    end
  end

  def show
    @user = User.find(params[:id])
    @weights = @user.weights.page(params[:page]).per(14)
    @profile = @user.profile

    if mastodon_connected?(@user)
      @weightodon = @user.weightodon
      @account = valid_account?(@weightodon.access_token)
    end

    if @weights.first
      @latest_weight = @latest_weight.value
    else
      @latest_weight = @profile.start_weight
    end

    if params[:duration] == "all"
      @graph_weights = @user.weights.pluck(:value)
      @graph_date = @user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}
    elsif params[:duration] == "3month"
      @graph_weights = @user.weights.pluck(:value).take(90)
      @graph_date = @user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}.take(90)
    elsif params[:duration] == "month"
      @graph_weights = @user.weights.pluck(:value).take(30)
      @graph_date = @user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}.take(30)
    else
      @graph_weights = @user.weights.pluck(:value).take(7)
      @graph_date = @user.weights.pluck(:date).map{|date| date.strftime("%m/%d")}.take(7)
    end

    @graph_weights.reverse!
    @graph_date.reverse!
  end
end
