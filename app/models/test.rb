class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests
  has_many :users, through: :user_tests

  class << self
    def sort_by_category(name)
      joins(:category).where("categories.title = ?", name)
                      .order(title: :desc)
                      .pluck("tests.title")
    end
  end
end
