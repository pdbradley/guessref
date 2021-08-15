class AddsChapterAnswers
  def initialize(verse)
    @verse = verse
  end

  def add_answers
    @verse.chapter_answers.create all_guesses_random_order
  end

  def three_guesses
    SuppliesThreeChapterNumberGuesses.new(@verse.book_number.to_i, @verse.chapter_number.to_i).guesses
  end

  def three_guesses_attributes
    three_guesses.map do |guess|
      { label: guess, correct: false, point_value: 0 }
    end
  end

  def correct_answer_attributes
    {label: @verse.chapter_number, correct: true, point_value: 1}
  end

  def all_guesses_random_order
    (three_guesses_attributes + [correct_answer_attributes]).shuffle
  end

end
