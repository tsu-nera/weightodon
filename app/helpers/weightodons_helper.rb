module WeightodonsHelper

  def toot(user, message)
    if mastodon_connected?(user)
      client = Mastodon::REST::Client.new(base_url: 'https://weightodon.site', bearer_token: user.weightodon.access_token)
      client.create_status(message)
    end
  end

  def send_weightodon(user, weight)
    toot(user, "絶対痩せるぞ！！　絶対運動するぞ！！　絶対ダイエットするぞ！！　今の体重は %.1f kg！！ #web" % [weight])
  end

  def mastodon_connected?(user = current_user)
    not user.weightodon.nil?
  end

  def valid_account?(token)
    client = Mastodon::REST::Client.new(base_url: 'https://weightodon.site', bearer_token: token)
    begin
      accuunt = client.verify_credentials
    rescue
      accuunt = nil
    end
    accuunt
  end
end
