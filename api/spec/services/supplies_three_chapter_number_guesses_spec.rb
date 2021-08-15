require 'rails_helper'

RSpec.describe SuppliesThreeChapterNumberGuesses do
    describe ".guesses" do
        it "returns an array of three unique numbers" do
            result = SuppliesThreeChapterNumberGuesses.new(40, 1).guesses

            expect(result.length).to eq 3
            expect(result.uniq.length).to eq 3
            expect(result.all? { |i| i.is_a?(Integer) }).to eq true
        end
        it "returns an array of numbers close to inputted chapter number" do
            result = SuppliesThreeChapterNumberGuesses.new(40, 20).guesses

            expect(result.max - result.min).to be <= 10
        end
        it "does not return any negative values or zero" do
            result = SuppliesThreeChapterNumberGuesses.new(40, 1).guesses

            expect(result.min).to be > 0
        end
        it "does not return any values greater than the number of chapters of given book" do
            result = SuppliesThreeChapterNumberGuesses.new(40, 1).guesses

            expect(result.max).to be < 26
        end
    end
end