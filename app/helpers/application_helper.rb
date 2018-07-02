module ApplicationHelper
  def mastodon_connected?
    not current_user.weightodon.nil?
  end
end
