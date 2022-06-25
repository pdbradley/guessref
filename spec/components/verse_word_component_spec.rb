# frozen_string_literal: true

require "rails_helper"

RSpec.describe VerseWordComponent, type: :component do
  it "renders a visible word" do
    verse_word = create(:verse_word, word_text: 'Foo', visible: true)

    render_inline(VerseWordComponent.new(verse_word))

    expect(page).to have_css ".visible", text: 'Foo'
  end
  it "renders an invisible word" do
    verse_word = create(:verse_word, word_text: 'Bar', visible: false)

    render_inline(VerseWordComponent.new(verse_word))

    expect(page).to have_css ".invisible", text: 'Bar'
  end
end
