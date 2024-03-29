class TestPassage < ApplicationRecord
  THRESHOLD = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def successful?
    if correct_answers_percentage >= THRESHOLD
      true
    else
      false
    end
  end

  def correct_answers_percentage
    (correct_questions.to_f * 100 / test.questions.count).to_i
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def time_is_over?
    return false if test.time_limit.zero?

    Time.now > self.deadline
  end

  def time_left
    deadline - Time.now
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    unless answer_ids.nil?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      false
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def deadline
    created_at + test.time_limit.minutes
  end
end
