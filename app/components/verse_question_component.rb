# frozen_string_literal: true

class VerseQuestionComponent < ViewComponent::Base
  def initialize(verse:)
    @verse = verse
  end

  def render?
    @verse
  end

end
