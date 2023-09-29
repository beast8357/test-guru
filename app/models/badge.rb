class Badge < ApplicationRecord

  has_many :users_badges
  has_many :users, through: :users_badges

  validates :name, presence: true
  validates :image_name, presence: true
  validates :description, presence: true

end
