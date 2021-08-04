class AddsBookAnswers
  def initialize(verse)
    @verse = verse
  end

  def add_answers
    # obviously this will get smarter
    @verse.book_answers.create!(point_value: 1, correct: true, label: @verse.book_number)
    @verse.book_answers.create!(label: @verse.book_number + 1)
    @verse.book_answers.create!(label: @verse.book_number + 1)
    @verse.book_answers.create!(label: @verse.book_number + 1)
  end
end
