# frozen_string_literal: true

class BookChoicesComponent < ViewComponent::Base
  def initialize(verse:)
    @verse = verse
  end
end
