class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :nicname, presence: true, length: {maximum: 15}
  validates :public, presence: true
  validates :height, presence: true, numericality: true
  validates :start_weight, presence: true, numericality: true
  validates :sex, presence: true
  validates :age, presence: true, numericality: true
  validates :message, presence: true, length: {maximum: 30}
end
