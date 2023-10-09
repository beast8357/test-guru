module TestPassagesHelper
  def results_header(test_passage)
    if test_passage.successful?
      t('.success', test_title: test_passage.test.title)
    else
      t('.fail', test_title: test_passage.test.title)
    end
  end

  def test_results(test_passage)
    if test_passage.successful?
      "<p>
         #{t('.result')}
         <span class='success'>
           #{test_passage.correct_answers_percentage}%
         </span>
       </p>".html_safe
    else
      "<p>
         #{t('.result')} 
         <span class='failure'>
           #{test_passage.correct_answers_percentage}%
         </span>
       </p>".html_safe
    end
  end
end
