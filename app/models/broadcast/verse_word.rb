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
        verse_word.game_session,
        target: dom_id(verse_word),
        # it would be better to just adjust a class
        # rather than re-render the entire verseword component
        # todo
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
