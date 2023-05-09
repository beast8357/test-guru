users = User.create(
  [
    { email: "alex228@gmail.com", password: "qweqwe", password_confirmation: "qweqwe" },
    { email: "deffka@gmail.com", password: "qweqwe", password_confirmation: "qweqwe" },
    { email: "serious@gmail.com", password: "qweqwe", password_confirmation: "qweqwe" },
  ]
)

categories = Category.create(
  [
    { title: "Programming" },
    { title: "Music Mixing" },
    { title: "Gaming" },
  ]
)

tests = Test.create(
  [
    {
      title: "Ruby Basics",
      level: 1,
      category_id: Category.find_by_title("Programming").id,
      creator_id: User.first.id
    },
    {
      title: "Ruby Intermediate",
      level: 2,
      category_id: Category.find_by_title("Programming").id,
      creator_id: User.first.id
    },
    {
      title: "Mixing Basics",
      level: 1,
      category_id: Category.find_by_title("Music Mixing").id,
      creator_id: User.first.id
    },
    {
      title: "Mixing Advanced",
      level: 3,
      category_id: Category.find_by_title("Music Mixing").id,
      creator_id: User.first.id
    },
    {
      title: "Deus Ex",
      level: 3,
      category_id: Category.find_by_title("Gaming").id,
      creator_id: User.first.id
    },
    {
      title: "Amnesia",
      level: 2,
      category_id: Category.find_by_title("Gaming").id,
      creator_id: User.first.id
    },
  ]
)

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
