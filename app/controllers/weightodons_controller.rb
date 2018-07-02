class WeightodonsController < ApplicationController
  WEIGHTODON_HOST = 'https://weightodon.site'
  WEIGHITODON_APP_NAME = 'weightodon'

  def new
    @weightodon = Weightodon.new
  end

  def create
    mastodon = Mastodon::REST::Client.new(base_url: WEIGHTODON_HOST)
    app = mastodon.create_app(WEIGHITODON_APP_NAME, 'urn:ietf:wg:oauth:2.0:oob', 'read write follow')

    client = OAuth2::Client.new(app.client_id, app.client_secret, site: WEIGHTODON_HOST)
    token = client.password.get_token(params[:username], params[:password], scope: 'read write follow')


    @weightodon = Weightodon.new
    @weightodon.user_id = current_user.id
    @weightodon.access_token = token

    if @weightodon.save
      flash[:notice] = 'マストドンとの連携に成功しました。'
    else
      flash[:alert] = 'マストドンとの連携に失敗しました。'
    end

    redirect_to root_url
  end

  def destroy
  end
end
