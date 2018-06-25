class ProfilesController < ApplicationController
  def show
  end

  def new
  end

  def create
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      flash[:notice] = '正常に更新されました。'
    else
      flash.now[:alart] = '正常に更新されませんでした。'
      render :edit
    end

    redirect_to root_url
  end

  def profile_params
    params.require(:profile).permit(
        :nicname, :public, :height, :start_weight, :sex, :age, :message)
  end
end