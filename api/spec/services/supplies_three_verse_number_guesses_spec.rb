require 'rails_helper'

RSpec.describe SuppliesThreeVerseNumberGuesses do
    describe ".guesses" do
        it "returns an array of three unique numbers" do
            result = SuppliesThreeVerseNumberGuesses.new(1).guesses

            expect(result.length).to eq 3
            expect(result.uniq.length).to eq 3
            expect(result.all? { |i| i.is_a?(Integer) }).to eq true
        end
        it "returns an array of numbers close to inputted verse number" do
            result = SuppliesThreeVerseNumberGuesses.new(20).guesses

            expect(result.max - result.min).to be <= 10
        end
        # it "does not return any negative values or zero" do
        #     result = SuppliesThreeverseNumberGuesses.new(1).guesses

        #     expect(result.max - result.min).to be < 10
        # end
    end
end