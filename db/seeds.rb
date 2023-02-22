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
  ]
)

tests = Test.create(
  [
    {
      title: "Ruby Basics",
      level: 1,
      category_id: Category.find_by!(title: "Programming").id
    },
    {
      title: "Ruby Intermediate",
      level: 2,
      category_id: Category.find_by!(title: "Programming").id
    },
    {
      title: "Mixing Basics",
      level: 1,
      category_id: Category.find_by!(title: "Music Mixing").id
    },
    {
      title: "Mixing Advanced",
      level: 3,
      category_id: Category.find_by!(title: "Music Mixing").id
    },
  ]
)

questions = Question.create(
  [
    {
      body: "Does a method definition start with the word \'def\'?",
      test_id: Test.find_by!(title: "Ruby Basics").id
    },
    {
      body: "Can you call private methods from other classes?",
      test_id: Test.find_by!(title: "Ruby Basics").id
    },
    {
      body: "Do \'proc\' and \'lambda\' act the same way?",
      test_id: Test.find_by!(title: "Ruby Intermediate").id
    },
    {
      body: "Is everything an object in Ruby?",
      test_id: Test.find_by!(title: "Ruby Intermediate").id
    },
    {
      body: "First you do mixing and only then mastering",
      test_id: Test.find_by!(title: "Mixing Basics").id
    },
    {
      body: "Equalizers are used to compress the audio signal",
      test_id: Test.find_by!(title: "Mixing Basics").id
    },
    {
      body: "Parallel compression is when you put the audio " \
            "signal through several compressors on different channels",
      test_id: Test.find_by!(title: "Mixing Advanced").id
    },
    {
      body: "On the mix bus it\'s best to use an EQ in zero-latency mode",
      test_id: Test.find_by!(title: "Mixing Advanced").id
    },
  ]
)

questions.each.with_index(1) do |question, index|
  Answer.create(body: "Yes", correct: true, question_id: question.id)
  Answer.create(body: "No", correct: false, question_id: question.id)
end
