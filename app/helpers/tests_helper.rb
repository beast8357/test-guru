module TestsHelper
  TEST_LEVELS = { 0 => 'unknown', 1 => 'Easy', 2 => 'Medium', 3 => 'Hard' }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || 'Insane!'
  end

  def test_header(test)
    if test.new_record?
      t('.create')
    else
      t('.edit')
    end
  end
end
