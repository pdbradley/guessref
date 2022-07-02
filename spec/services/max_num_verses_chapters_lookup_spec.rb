require 'rails_helper'

RSpec.describe MaxNumVersesChaptersLookup do
  it 'knows how many chapters in a book' do
    expect(MaxNumVersesChaptersLookup.get_max_chapters(1)).to eq 50  # genesis
    expect(MaxNumVersesChaptersLookup.get_max_chapters(40)).to eq 28  # matthew
  end

  it 'knows how many verses are in a chapter' do
    expect(MaxNumVersesChaptersLookup.get_max_verses(1, 1)).to eq 31  # genesis
    expect(MaxNumVersesChaptersLookup.get_max_verses(40, 1)).to eq 25  # matthew
  end
end
