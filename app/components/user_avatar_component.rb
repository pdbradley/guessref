class UserAvatarComponent < ViewComponent::Base

  def initialize(name:, color: nil)
    @words = name.split
    @color = color || random_color
    @text = avatar_text
  end

  private

  def one_word_name?
    @words.size == 1
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
    else
      first_two_initials
    end
  end

  def random_color
    #https://www.randomlists.com/random-color
    %w(#FFA07A #CD853F #00FFFF #B0E0E6 #DA70D6 #2F4F4F).sample
  end

end
