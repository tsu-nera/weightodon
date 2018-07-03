module WeightodonsHelper

  def send_weightodon(user, weight)
    if mastodon_connected?(user)
      client = Mastodon::REST::Client.new(base_url: 'https://weightodon.site', bearer_token: user.weightodon.access_token)
      client.create_status("絶対痩せるぞ！！　絶対運動するぞ！！　絶対ダイエットするぞ！！　今の体重は %.1f kg！！ #web" % [weight])
    end
  end

  def mastodon_connected?(user = current_user)
    not user.weightodon.nil?
  end
end
