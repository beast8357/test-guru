module QuestionsHelper

  def question_header(test, question)
    if question.new_record?
      t('.create', test_title: question.test.title)
    else
      t('.edit', test_title: question.test.title)
    end
  end

end
