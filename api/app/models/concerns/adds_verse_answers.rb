class AddsVerseAnswers
  def initialize(verse)
    @verse = verse
  end

  def add_answers
    # obviously this will get smarter
    @verse.verse_answers.create!(point_value: 1, correct: true, label: @verse.verse_number)
    @verse.verse_answers.create!(label: @verse.verse_number + 1)
    @verse.verse_answers.create!(label: @verse.verse_number + 1)
    @verse.verse_answers.create!(label: @verse.verse_number + 1)
  end
end
