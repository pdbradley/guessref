class VerseWordComponentPreview < ViewComponent::Preview
  layout 'component_preview'
  def invisible
    verse_word = FactoryBot.build_stubbed(:verse_word, word_text: 'Behold', visible: false)
    render(VerseWordComponent.new(verse_word))
  end

  def visible
    verse_word = FactoryBot.build_stubbed(:verse_word, word_text: 'Behold', visible: true)
    render(VerseWordComponent.new(verse_word))
  end
end
