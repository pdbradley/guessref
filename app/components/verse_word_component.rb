class VerseWordComponent < ViewComponent::Base
  def initialize(word_text:, visible: false)
    @word_text = word_text
    @visible = visible
  end


end
