require 'rails_helper'

RSpec.describe SuppliesThreeChapterNumberGuesses do
  describe ".guesses" do
    it "returns an array book guesses that are relevant for Genesis" do
      guesses = SuppliesThreeBookNumberGuesses.new(SuppliesThreeBookNumberGuesses::GENESIS).guesses
      expect(guesses.length).to eq 3
      expect(guesses.uniq.length).to eq 3

      guesses.each do |guess|
        expect([
          SuppliesThreeBookNumberGuesses::EXODUS,
          SuppliesThreeBookNumberGuesses::LEVITICUS,
          SuppliesThreeBookNumberGuesses::NUMBERS,
          SuppliesThreeBookNumberGuesses::DEUTERONOMY
        ]).to include(guess)
      end
    end
    it "returns an array of three guesses for each book of the new testament" do
      (40..66).each do |book_number|
        guesses = SuppliesThreeBookNumberGuesses.new(book_number).guesses
        expect(guesses.length).to eq 3
        expect(guesses.uniq.length).to eq 3
      end
    end
  end
end
