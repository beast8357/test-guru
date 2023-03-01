users = User.create(
  [
    { name: "Alex", email: "alex228@jail.com" },
    { name: "Zelda", email: "deffka@jail.com" },
    { name: "Sam", email: "serious@jail.com" },
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
      creator_id: User.first
    },
    {
      title: "Ruby Intermediate",
      level: 2,
      category_id: Category.find_by_title("Programming").id,
      creator_id: User.first
    },
    {
      title: "Mixing Basics",
      level: 1,
      category_id: Category.find_by_title("Music Mixing").id,
      creator_id: User.first
    },
    {
      title: "Mixing Advanced",
      level: 3,
      category_id: Category.find_by_title("Music Mixing").id,
      creator_id: User.first
    },
    {
      title: "Deus Ex",
      level: 2,
      category_id: Category.find_by_title("Gaming").id,
      creator_id: User.first
    },
    {
      title: "Amnesia",
      level: 3,
      category_id: Category.find_by_title("Gaming").id,
      creator_id: User.first
    },
  ]
)

questions = Question.create(
  [
    {
      body: "Does a method definition start with the word \'def\'?",
      test_id: Test.find_by_title("Ruby Basics").id
    },
    {
      body: "Do methods that return " \
            " \'true\' or \'false\' have an exclamation mark at the end?",
      test_id: Test.find_by_title("Ruby Basics").id
    },
    {
      body: "Are classes objects?",
      test_id: Test.find_by_title("Ruby Basics").id
    },
    {
      body: "Do \'proc\' and \'lambda\' act the same way?",
      test_id: Test.find_by_title("Ruby Intermediate").id
    },
    {
      body: "Can you call private methods from other classes?",
      test_id: Test.find_by_title("Ruby Intermediate").id
    },
    {
      body: "Are \'private\' methods different from \'protected\' methods?",
      test_id: Test.find_by_title("Ruby Intermediate").id
    },
    {
      body: "First you do mixing and only then mastering",
      test_id: Test.find_by_title("Mixing Basics").id
    },
    {
      body: "Equalizers are used to compress the audio signal",
      test_id: Test.find_by_title("Mixing Basics").id
    },
    {
      body: "To create an echo effect you need to use delay plugins",
      test_id: Test.find_by_title("Mixing Basics").id
    },
    {
      body: "Parallel compression is when you put the audio " \
            "signal through several compressors on different channels",
      test_id: Test.find_by_title("Mixing Advanced").id
    },
    {
      body: "On the mix bus it\'s best to use an EQ in zero-latency mode",
      test_id: Test.find_by_title("Mixing Advanced").id
    },
    {
      body: "You need to sidechain the kick drum " \
            "to the bass to prevent low frequencies from overlapping",
      test_id: Test.find_by_title("Mixing Advanced").id
    },
    {
      body: "The latest game in the series is called \'Deus Ex: Mankind Divided\'",
      test_id: Test.find_by_title("Deus Ex").id
    },
    {
      body: "Adam Jensen found out that he had secret " \
            "augmentations in Deus Ex: Human Revolution",
      test_id: Test.find_by_title("Deus Ex").id
    },
    {
      body: "The action in first game of the series takes place in year 2052",
      test_id: Test.find_by_title("Deus Ex").id
    },
    {
      body: "Alexander of Brennenburg is the main villain in Amnesia: The Dark Descent",
      test_id: Test.find_by_title("Amnesia").id
    },
    {
      body: "Oswald Mandus killed his own children in Amnesia: A Machine for Pigs",
      test_id: Test.find_by_title("Amnesia").id
    },
    {
      body: "Tasi Trianon in Amnesia: Rebirth can use weapons against monsters",
      test_id: Test.find_by_title("Amnesia").id
    },
  ]
)

questions.each.with_index(1) do |question, index|
  Answer.create(body: "Yes", correct: true, question_id: question.id)
  Answer.create(body: "No", correct: false, question_id: question.id)
end
