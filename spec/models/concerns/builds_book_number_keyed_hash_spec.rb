require 'rails_helper'

RSpec.describe BuildsBookNumberKeyedHash do
  describe "hash from the bible.json file" do
    it "contains chapter and book info" do
      result = BuildsBookNumberKeyedHash.new.hash

      expect(result[1]['chapters'].size).to eq 50     #50 chapters in Genesis
      expect(result[1]['chapters'][1]).to eq 31   #31 verses in Genesis 1

      expect(result[40]['chapters'].size).to eq 28     #Matthew
      expect(result[40]['chapters'][1]).to eq 25

      expect(result[66]['chapters'].size).to eq 22     #Revelation
      expect(result[66]['chapters'][1]).to eq 20
    end
    it "contains the abbreviation and the book_name" do
      result = BuildsBookNumberKeyedHash.new.hash

      expect(result[1]['abbreviation']).to eq 'Gen'
      expect(result[1]['book_name']).to eq 'Genesis'
    end
  end
end
