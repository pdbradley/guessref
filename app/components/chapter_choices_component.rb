# frozen_string_literal: true

class ChapterChoicesComponent < ViewComponent::Base
  def initialize(verse:)
    @verse = verse
  end
end

