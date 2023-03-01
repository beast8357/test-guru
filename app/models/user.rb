class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :created_tests, class_name: "Test", foreign_key: "creator_id"

  def completed_tests_by_level(level)
    tests.where(level: level)
  end
end
