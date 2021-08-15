require 'rails_helper'

RSpec.describe SuppliesThreeVerseNumberGuesses do
    describe ".guesses" do
        it "returns an array of three unique numbers" do
            result = SuppliesThreeVerseNumberGuesses.new(40, 1, 1).guesses

            expect(result.length).to eq 3
            expect(result.uniq.length).to eq 3
            expect(result.all? { |i| i.is_a?(Integer) }).to eq true
        end
        it "returns an array of numbers close to inputted verse number" do
            result = SuppliesThreeVerseNumberGuesses.new(40, 1, 1).guesses

            expect(result.max - result.min).to be <= 10
        end
        it "does not return any negative values or zero" do
            result = SuppliesThreeVerseNumberGuesses.new(40, 1, 1).guesses

            expect(result.min).to be > 0
        end
        it "does not return any values greater than the number of verses of given chapter" do
            result = SuppliesThreeVerseNumberGuesses.new(40, 1, 25).guesses

            expect(result.max).to be < 26
        end
    end
end