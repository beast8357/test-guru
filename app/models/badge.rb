class Badge < ApplicationRecord

  validates :name, presence: true
  validates :image_name, presence: true
  validates :criterion, presence: true

end
