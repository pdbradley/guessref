# frozen_string_literal: true

class VerseWordComponentPreview < ViewComponent::Preview
  def invisible
    verse_word = FactoryBot.create(:verse_word, word_text: 'Behold', visible: false)
    render(VerseWordComponent.new(verse_word))
  end

  def visible
    verse_word = FactoryBot.create(:verse_word, word_text: 'Behold', visible: true)
    render(VerseWordComponent.new(verse_word))
  end
end
