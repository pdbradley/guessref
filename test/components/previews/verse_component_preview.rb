class VerseComponentPreview < ViewComponent::Preview

  layout 'component_preview'

  def visible
    render(VerseComponent.new(verse: visible_verses))
  end

  def invisible
    render(VerseComponent.new(verse: invisible_verses))
  end

  def mixed
    render(VerseComponent.new(verse: mixed_verses))
  end

  private

  def visible_verses
    verse = FactoryBot.build_stubbed(:stubbed_verse)
    verse.verse_words.each do |vw|
      vw.visible = true
    end
    verse
  end

  def invisible_verses
    verse = FactoryBot.build_stubbed(:stubbed_verse)
    verse.verse_words.each do |vw|
      vw.visible = false
    end
    verse
  end

  def mixed_verses
    verse = FactoryBot.build_stubbed(:stubbed_verse)
    verse.verse_words.each do |vw|
      vw.visible = [true, false].sample
    end
    verse
  end
end
