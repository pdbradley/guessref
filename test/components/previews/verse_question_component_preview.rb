class VerseQuestionComponentPreview < ViewComponent::Preview

  layout 'component_preview'

  def john316_initial
    render(VerseQuestionComponent.new(verse: foo))
  end

  private

  def foo
    verse = FactoryBot.create(:verse)
    verse.random_from_fixture
    verse
  end

end
