module TestPassagesHelper

  def results_header(test_passage)
    if test_passage.successful?
      "You've successfully passed the \'#{test_passage.test.title}\' test!"
    else
      "You failed the \'#{test_passage.test.title}\' test :("
    end
  end

  def test_results(test_passage)
    if test_passage.successful?
      "<p>Your result: <span class='success'>#{test_passage.correct_answers_percentage}%</span></p>".html_safe
    else
      "<p>Your result: <span class='failure'>#{test_passage.correct_answers_percentage}%</span></p>".html_safe
    end
  end

end
