class VerseQuestionComponentPreview < ViewComponent::Preview

  layout 'component_preview'

  def john316_initial
    render(VerseQuestionComponent.new(verse: foo))
  end

  private

  def foo
    verse = FactoryBot.build_stubbed(:stubbed_verse)
    verse
  end

end
