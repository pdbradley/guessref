class VerseComponentPreview < ViewComponent::Preview
  def visible
    render(VerseComponent.new(verse_words: visible_verses))
  end

  def invisible
    render(VerseComponent.new(verse_words: invisible_verses))
  end

  def mixed
    render(VerseComponent.new(verse_words: mixed_verses))
  end

  private

  def visible_verses
    FactoryBot.create_list(:verse_word, 20, visible: true)
  end

  def invisible_verses
    FactoryBot.create_list(:verse_word, 20, visible: false)
  end

  def mixed_verses
    50.times.map do
      FactoryBot.create(:verse_word, visible: [true, false].sample)
    end
  end
end
