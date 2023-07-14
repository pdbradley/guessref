require 'rails_helper'

RSpec.describe BuildsBookNumberKeyedHash do
  describe "hash from the bible.json file" do
    it "returns a hash keyed on book_number" do
      result = BuildsBookNumberKeyedHash.new.hash

      expect(result['1'].size).to eq 50     #50 chapters in Genesis
      expect(result['1']['1']).to eq '31'   #31 verses in Genesis 1

      expect(result['40'].size).to eq 28     #Matthew
      expect(result['40']['1']).to eq '25'

      expect(result['66'].size).to eq 22     #Revelation
      expect(result['66']['1']).to eq '20'
    end
  end
end
