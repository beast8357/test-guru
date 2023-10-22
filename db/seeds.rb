# Users
users = User.create(
  [
    { first_name: "User",
      last_name: "Regular",
      email: "user@gmail.com",
      password: "qweqwe",
      password_confirmation: "qweqwe" },
    { type: "Admin",
      first_name: "Bulat",
      last_name: "Khairutdinov",
      email: "god@admin.com",
      password: "qweqwe",
      password_confirmation: "qweqwe" },
  ]
)

# Badges
Badge.create(name: "First Test",
             image_name: "first_test.png",
             description: "This badge is given to you once you pass your first test")
Badge.create(name: "Flawless Test",
             image_name: "flawless_test.png",
             description: "You answered all the test questions correctly")
Badge.create(name: "Epic Fail",
             image_name: "epic_fail.png",
             description: "You answered all the test questions incorrectly")
Badge.create(name: "Amazing First Attempt",
             image_name: "amazing_first_attempt.png",
             description: "You have successfully passed the test on the first attempt")
Badge.create(name: "Programming Guru",
             image_name: "programming_guru.png",
             description: "You have successfully passed all the tests from the 'Programming' category")
Badge.create(name: "Music Mixing Guru",
             image_name: "music_mixing_guru.png",
             description: "You have successfully passed all the tests from the 'Music Mixing' category")
Badge.create(name: "Gaming Guru",
             image_name: "gaming_guru.png",
             description: "You have successfully passed all the tests from the 'Gaming' category")
Badge.create(name: "Easy Peasy",
             image_name: "easy_peasy.png",
             description: "You have successfully passed all the tests with level 'Easy'")
Badge.create(name: "Medium Rare",
             image_name: "medium_rare.png",
             description: "You have successfully passed all the tests with level 'Medium'")
Badge.create(name: "Die Hard",
             image_name: "die_hard.png",
             description: "You have successfully passed all the tests with level 'Hard'")

# Categories
categories = Category.create(
  [
    { title: "Programming" },
    { title: "Music Mixing" },
    { title: "Gaming" },
  ]
)

# Category tests
tests = Test.create(
  [
    {
      title: "Ruby Basics",
      level: 1,
      category_id: Category.find_by_title("Programming").id,
      creator_id: User.find_by_email("god@admin.com").id,
      active: true,
    },
    {
      title: "Ruby Intermediate",
      level: 2,
      category_id: Category.find_by_title("Programming").id,
      creator_id: User.find_by_email("god@admin.com").id,
      active: true,
    },
    {
      title: "Mixing Basics",
      level: 1,
      category_id: Category.find_by_title("Music Mixing").id,
      creator_id: User.find_by_email("god@admin.com").id,
      active: true,
    },
    {
      title: "Mixing Advanced",
      level: 3,
      category_id: Category.find_by_title("Music Mixing").id,
      creator_id: User.find_by_email("god@admin.com").id,
      active: true,
    },
    {
      title: "Deus Ex",
      level: 3,
      category_id: Category.find_by_title("Gaming").id,
      creator_id: User.find_by_email("god@admin.com").id,
      active: true,
    },
    {
      title: "Amnesia",
      level: 2,
      category_id: Category.find_by_title("Gaming").id,
      creator_id: User.find_by_email("god@admin.com").id,
      active: true,
    },
  ]
)

# Test questions
questions = Question.create(
  [
    {
      body: "Does a method definition start with the word \'def\'?",
      test_id: Test.find_by_title("Ruby Basics").id,
    },
    {
      body: "Do methods that return " \
            "\'true\' or \'false\' have an exclamation mark at the end?",
      test_id: Test.find_by_title("Ruby Basics").id,
    },
    {
      body: "Are classes objects?",
      test_id: Test.find_by_title("Ruby Basics").id,
    },
    {
      body: "Are there any differences between \'proc\' and \'lambda\'?",
      test_id: Test.find_by_title("Ruby Intermediate").id,
    },
    {
      body: "Can you call private methods from other classes?",
      test_id: Test.find_by_title("Ruby Intermediate").id,
    },
    {
      body: "Are \'private\' methods different from \'protected\' methods?",
      test_id: Test.find_by_title("Ruby Intermediate").id,
    },
    {
      body: "When mixing a song is volume balancing in the first place?",
      test_id: Test.find_by_title("Mixing Basics").id,
    },
    {
      body: "Are equalizers used to compress the audio signal",
      test_id: Test.find_by_title("Mixing Basics").id,
    },
    {
      body: "Should you use chorus to create an echo effect?",
      test_id: Test.find_by_title("Mixing Basics").id,
    },
    {
      body: "Is parallel compression used when mixing vocals?",
      test_id: Test.find_by_title("Mixing Advanced").id,
    },
    {
      body: "Is it OK to use an EQ in zero-latency mode on the mix bus?",
      test_id: Test.find_by_title("Mixing Advanced").id,
    },
    {
      body: "Do you need to sidechain the kick drum " \
            "to the bass to prevent low frequencies from overlapping?",
      test_id: Test.find_by_title("Mixing Advanced").id,
    },
    {
      body: "Is the latest game in the series called \'Deus Ex: Mankind Divided\'?",
      test_id: Test.find_by_title("Deus Ex").id,
    },
    {
      body: "Did Adam Jensen find out that he'd had secret " \
            "augmentations in Deus Ex: Human Revolution?",
      test_id: Test.find_by_title("Deus Ex").id,
    },
    {
      body: "Does the action in the first game of the series take place in year 2052?",
      test_id: Test.find_by_title("Deus Ex").id,
    },
    {
      body: "Is Alexander of Brennenburg the main villain in Amnesia: The Dark Descent?",
      test_id: Test.find_by_title("Amnesia").id,
    },
    {
      body: "Did Oswald Mandus kill his own children in Amnesia: A Machine for Pigs?",
      test_id: Test.find_by_title("Amnesia").id,
    },
    {
      body: "Can Tasi Trianon use weapons against monsters in Amnesia: Rebirth?",
      test_id: Test.find_by_title("Amnesia").id,
    },
  ]
)

# Question answers
question_ids_one = [1, 3, 4, 6, 7, 10, 12, 13, 15, 16, 17]
question_ids_two = [2, 5, 8, 9, 11, 14, 18]

question_ids_one.each do |id|
  Answer.create(body: "Yes", correct: true, question_id: id)
  Answer.create(body: "No", correct: false, question_id: id)
end

question_ids_two.each do |id|
  Answer.create(body: "Yes", correct: false, question_id: id)
  Answer.create(body: "No", correct: true, question_id: id)
end
