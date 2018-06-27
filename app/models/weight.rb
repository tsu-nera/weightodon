class Weight < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :value, presence: true
  validates :date, presence: true
end