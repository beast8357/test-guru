class Test < ApplicationRecord

  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_category, -> (name) { joins(:category).where("categories.title = ?", name) }
  scope :by_level, -> (level) { where(level: level) }
  scope :level_unknown, -> { by_level(0) }
  scope :easy, -> { by_level(1) }
  scope :medium, -> { by_level(2) }
  scope :hard, -> { by_level(3) }
  scope :ready, -> { where(active: true) }
  
end
