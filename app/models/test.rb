class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests

  class << self
    def sort_by_category(name)
      joins(:category).where("categories.title = ?", name)
                      .order(title: :desc)
                      .pluck("tests.title")
    end
  end
end
