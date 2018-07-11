class Weightodon < ApplicationRecord
  validates :client_secret, presence: true

  belongs_to :user
end