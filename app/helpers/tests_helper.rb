module TestsHelper

  TEST_LEVELS = { 1 => 'Easy', 2 => 'Normal', 3 => 'Hard' }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || 'Hero'
  end

end
