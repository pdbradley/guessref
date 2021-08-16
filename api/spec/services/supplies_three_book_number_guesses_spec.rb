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
      expect(guesses).not_to include(SuppliesThreeBookNumberGuesses::GENESIS)
    end

    it "returns an array of three guesses for each book of the bible" do
      (1..66).each do |book_number|
        guesses = SuppliesThreeBookNumberGuesses.new(book_number).guesses
        expect(guesses.length).to eq 3
        expect(guesses.uniq.length).to eq 3
      end
    end

    it "assigns the other three gospels for Matthew" do
        guesses = SuppliesThreeBookNumberGuesses.new(SuppliesThreeBookNumberGuesses::MATTHEW).guesses
  
        expect(guesses.length).to eq 3
        expect(guesses.uniq.length).to eq 3
        guesses.each do |guess|
          expect([
            SuppliesThreeBookNumberGuesses::MARK,
            SuppliesThreeBookNumberGuesses::LUKE,
            SuppliesThreeBookNumberGuesses::JOHN,
          ]).to include(guess)
        end
        expect(guesses).not_to include(SuppliesThreeBookNumberGuesses::MATTHEW)
    end

    it "assigns the other three gospels for John" do
        guesses = SuppliesThreeBookNumberGuesses.new(SuppliesThreeBookNumberGuesses::JOHN).guesses
        
        expect(guesses.length).to eq 3
        expect(guesses.uniq.length).to eq 3
        guesses.each do |guess|
          expect([
            SuppliesThreeBookNumberGuesses::MATTHEW,
            SuppliesThreeBookNumberGuesses::MARK,
            SuppliesThreeBookNumberGuesses::LUKE,
          ]).to include(guess)
        end
        expect(guesses).not_to include(SuppliesThreeBookNumberGuesses::JOHN)
    end
  end
end