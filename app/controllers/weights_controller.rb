class WeightsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def show
    @weight = Weight.find(params[:id])
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = current_user.weights.build(weight_params)
    if @weight.save

      send_weightodon(current_user, @weight.value)

      flash[:notice] = '体重を投稿しました。'
    else
      @weights = current_user.weights.page(params[:page]).per(14)
      flash[:alert] = '体重の投稿に失敗しました。'
    end
    redirect_to root_url
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def update
    @weight = Weight.find(params[:id])

    if @weight.update(weight_params)
      flash[:notice] = '正常に更新されました。'
    else
      flash.now[:alert] = '正常に更新されませんでした。'
      render :edit
    end

    redirect_to root_url
  end

  def destroy
    @weight.destroy
    flash[:notice] = '体重を削除しました。'
    redirect_to root_url
  end

  private

  def weight_params
    params.require(:weight).permit(:value, :date)
  end

  def correct_user
    @weight = current_user.weights.find_by(id: params[:id])
    unless @weight
      redirect_to root_url
    end
  end
end
