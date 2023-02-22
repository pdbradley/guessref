class ChapterChoicesComponentPreview < ViewComponent::Preview

  layout 'component_preview'

  def whut
    render(ChapterChoicesComponent.new(verse: foo))
  end

  private

  def foo
    verse = FactoryBot.create(:verse)
    verse.random_from_fixture
    verse
  end

end
