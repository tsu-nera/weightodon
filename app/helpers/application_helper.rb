module ApplicationHelper
  def mastodon_connected?(user=current_user)
    not user.weightodon.nil?
  end
end
