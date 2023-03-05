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
    double("verse", verse_words: FactoryBot.create_list(:verse_word, 20, visible: true))
  end

  def invisible_verses
    double("verse", verse_words: FactoryBot.create_list(:verse_word, 20, visible: false))
  end

  def mixed_verses
    double("verse", verse_words: (
    50.times.map do
      FactoryBot.create(:verse_word, visible: [true, false].sample)
    end))
  end
end
