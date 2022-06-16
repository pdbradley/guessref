include ActionView::RecordIdentifier
module Broadcast
  class VerseWord

    def self.update(verse_word)
      new(verse_word).update
    end

    def initialize(verse_word)
      @verse_word = verse_word
    end

    def update
      Turbo::StreamsChannel.broadcast_update_later_to(
        "guessref",
        target: dom_id(verse_word),
        html: rendered_component
      )
    end

    private

    attr_reader :verse_word

    def rendered_component
      ApplicationController.render(
        VerseWordComponent.new(verse_word),
        layout: false
      )
    end
  end
end
