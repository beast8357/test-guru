module QuestionsHelper
  def question_header(test, question)
    if question.new_record?
      t('.create')
    else
      t('.edit')
    end
  end
end
