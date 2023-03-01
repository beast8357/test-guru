class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests

  def completed_tests_by_level(level)
    tests.where(level: level)
  end
end
