# frozen_string_literal: true

class RevealedReferenceComponent < ViewComponent::Base
  # this probably should just be three components
  def initialize(message)
    @message = message
  end

  def message
    @message
  end

end

