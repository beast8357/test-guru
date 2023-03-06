class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :created_tests, class_name: "Test", foreign_key: "creator_id"

  validates :email, presence: true

  def completed_tests_by_level(level)
    tests.by_level(level)
  end
end
