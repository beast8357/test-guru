class Answer < ApplicationRecord
  MAX_ANSWERS_COUNT = 4

  belongs_to :question

  validates :body, presence: true

  validate :validate_question_answers_count_limit, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_question_answers_count_limit
    errors.add(:question, "cannot contain more than 4 answers") if
    question.answers.count >= MAX_ANSWERS_COUNT
  end
end
