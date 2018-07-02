class WeightodonsController < ApplicationController
  WEIGHTODON_HOST = 'https://weightodon.site'
  WEIGHITODON_APP_NAME = 'weightodon'

  def new
    @weightodon = Weightodon.new
  end

  def create
    @weightodon = current_user.build_weightodon(weightodon_params)

    if @weightodon.save
      flash[:notice] = 'マストドンとの連携に成功しました。'
    else
      flash[:alert] = 'マストドンとの連携に失敗しました。'
    end

    redirect_to root_url
  end

  def destroy
    current_user.weightodon.destroy
    flash[:notice] = 'マストドンとの連携を解除しました。'
    redirect_to root_url
  end

  def weightodon_params()
    params.require(:weightodon).permit(:access_token)
  end
end
