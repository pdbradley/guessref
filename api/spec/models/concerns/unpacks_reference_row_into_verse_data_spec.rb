require 'rails_helper'

RSpec.describe UnpacksReferenceRowIntoVerseData do
  describe "#unpack" do
    # this is bad bc it hits the lsm api
    it "creates a hash that has book_number, chapter_number, verse_number, and reference" do
      result = UnpacksReferenceRowIntoVerseData.new("40,1,15,Matt 1:15")

      expect(result.valid?).to be_truthy
      expect(result.book_number).to eq '40'
      expect(result.chapter_number).to eq '1'
      expect(result.verse_number).to eq '15'
      expect(result.reference).to eq 'Matt 1:15'
      expect(result.text).to match /Eliud/
    end
  end
end
