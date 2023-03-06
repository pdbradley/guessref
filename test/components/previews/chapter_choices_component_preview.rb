class ChapterChoicesComponentPreview < ViewComponent::Preview

  layout 'component_preview'

  def whut
    render(ChapterChoicesComponent.new(verse: foo))
  end

  private

  def foo
    verse = FactoryBot.build_stubbed(:stubbed_verse)
    verse
  end

end

