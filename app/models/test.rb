class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests

  scope :by_category, -> (name) { joins(:category).where("categories.title = ?", name) }
  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
end
