class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      flash[:notice] = 'プロフィールを保存しました。'
      redirect_to root_url
    else
      flash[:alert] = 'プロフィールの保存に失敗しました。'
      redirect_back(fallback_location: new_profile_path)
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      flash[:notice] = '正常に更新されました。'
      redirect_to root_url
    else
      flash[:alert] = '正常に更新されませんでした。'
      render :edit
    end
  end

  def profile_params
    params.require(:profile).permit(
        :nicname, :public, :height, :start_weight, :sex, :age, :message)
  end
end