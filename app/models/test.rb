class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests

  class << self
    def sort_by_category(name)
      joins(:categories).where("categories.title = ?", name)
                        .order(title: :desc)
                        .pluck("tests.title")
    end
  end
end
