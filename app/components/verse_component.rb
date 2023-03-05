class VerseComponent< ViewComponent::Base

  def initialize(verse: nil)
    @verse = verse
    @verse_words = verse&.verse_words || []
  end

end
