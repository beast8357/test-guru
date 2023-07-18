module AnswersHelper

  def answer_header(current_question, answer)
    if answer.new_record?
      t('.create')
    else
      t('.edit')
    end
  end

end
