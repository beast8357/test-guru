class Question < ApplicationRecord

  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists

  validates :body, presence: true

  def number
    test.questions.ids.index(id) + 1
  end

end
