# frozen_string_literal: true

class VerseChoicesComponent < ViewComponent::Base
  def initialize(verse:)
    @verse = verse
  end
end
