class MastodonsController < ApplicationController
  MASTODON_HOST = 'https://weightodon.site'
  MASTODON_APP_NAME = 'weightodon'

  def new
    @mastodon = Mastodon.new
  end

  def create
    mastodon = Mastodon::REST::Client.new(base_url: MASTODON_HOST)
    app = mastodon.create_app(MASTODON_APP_NAME, 'urn:ietf:wg:oauth:2.0:oob', 'read write follow')

    client = OAuth2::Client.new(app.client_id, app.client_secret, site: MASTODON_HOST)
    token = client.password.get_token(params[:username], params[:password], scope: 'read write follow')


    @mastodon = Mastodon.new
    @mastodon.user_id = current_user.id
    @mastodon.access_token = token

    if @mastodon.save
      flash[:notice] = 'マストドンとの連携に成功しました。'
    else
      flash[:alert] = 'マストドンとの連携に失敗しました。'
    end

    redirect_to root_url
  end

  def destroy
  end
end
