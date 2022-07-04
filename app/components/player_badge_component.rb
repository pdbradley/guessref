# frozen_string_literal: true

class PlayerBadgeComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
