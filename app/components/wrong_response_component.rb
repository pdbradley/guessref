# frozen_string_literal: true

class WrongResponseComponent < ViewComponent::Base
  # this probably should just be three components
  def initialize(points)
    @points = points
  end

  def message
    if @points ==  0
      "Miss! 0 points"
    elsif @points == 1
      "Not bad, you got the book. 1 point"
    elsif @points == 2
      "Book and chapter! 2 points"
    elsif @points == 3
      "Wow!  Perfect. 3 points!"
    else
      ""
    end
  end

end
