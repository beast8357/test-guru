module TestPassagesHelper

  def result_header(test_passage)
    if test_passage.successful?
      "You've successfully passed the \'#{@test_passage.test.title}\' test!"
    else
      "You failed the \'#{@test_passage.test.title}\' test :("
    end
  end

end
