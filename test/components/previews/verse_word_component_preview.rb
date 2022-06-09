# frozen_string_literal: true

class VerseWordComponentPreview < ViewComponent::Preview
  def invisible
    render(VerseWordComponent.new(word_text: 'Behold'))
  end

  def visible
    render(VerseWordComponent.new(word_text: 'Behold', visible: true))
  end
end
