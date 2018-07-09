class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
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

  def destroy
    if not current_user.tokens.first.nil?
      current_user.remove_token(:activate)
    end
    @token = current_user.add_token(:activate)
  end

  private

  def profile_params
    params.require(:profile).permit(
        :nicname, :public, :height, :start_weight, :sex, :age, :message)
  end
end