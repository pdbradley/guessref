require 'rails_helper'

RSpec.describe PullsRandomVerseReferences do
  describe "#pull" do
    it 'pulls the appropriate number of verse references from the file' do
      # this test is silly but better than nothing
      result = PullsRandomVerseReferences.new(5).pull

      expect(result.size).to eq 5
    end
  end
end
