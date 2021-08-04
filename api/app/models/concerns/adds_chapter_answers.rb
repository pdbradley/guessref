class AddsChapterAnswers
  def initialize(verse)
    @verse = verse
  end

  def add_answers
    # obviously this will get smarter
    @verse.chapter_answers.create!(point_value: 1, correct: true, label: @verse.chapter_number)
    @verse.chapter_answers.create!(label: @verse.chapter_number + 1)
    @verse.chapter_answers.create!(label: @verse.chapter_number + 1)
    @verse.chapter_answers.create!(label: @verse.chapter_number + 1)
  end
end
