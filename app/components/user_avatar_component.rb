class UserAvatarComponent < ViewComponent::Base

  def initialize(name:, color: nil)
    @words = name.to_s.split
    @color = color || ColorPicker.random
    @text = avatar_text
  end

  private

  def one_word_name?
    @words.size == 1
  end
  
  def multi_word_name?
    @words.size > 1
  end

  def first_two_letters
    "#{@words.first[0..1]}"
  end

  def first_two_initials
    "#{@words.first[0]}#{@words.second[0]}"
  end

  def avatar_text
    if one_word_name?
      first_two_letters
    elsif multi_word_name?
      first_two_initials
    else
      '?'
    end
  end

end
