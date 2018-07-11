class Weightodon < ApplicationRecord
  validates :client_secret, presence: true, allow_blank: false

  belongs_to :user
end