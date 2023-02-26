class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  def completed_tests_by_level(level)
    tests.where(level: level)
  end
end
