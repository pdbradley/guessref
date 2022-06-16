class VerseWordComponent < ViewComponent::Base
  def initialize(verse_word)
    @verse_word = verse_word
    @word_text = verse_word.word_text
    @visible = verse_word.visible
  end

end
