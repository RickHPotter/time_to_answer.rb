# frozen_string_literal: true

data = JSON.parse(File.read(Rails.root.join('public/json/', 'science_questions.json')))

subject = Subject.create!(description: 'Science')

data.each do |question_data|
  question = Question.create!(
    description: question_data[:question],
    support: question_data[:support],
    subject_id: subject.id
  )

  question_id = question.id

  Answer.create!(description: question_data[:correct_answer], question_id:, correct: true)

  %i[distractor1 distractor2 distractor3].each do |distractor|
    Answer.create!(description: question_data[distractor], question_id:)
  end
end

