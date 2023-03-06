class VerseChoicesComponentPreview < ViewComponent::Preview

  layout 'component_preview'

  def whut
    render(VerseChoicesComponent.new(verse: foo))
  end

  private

  def foo
    verse = FactoryBot.build_stubbed(:stubbed_verse)
    verse
  end

end
