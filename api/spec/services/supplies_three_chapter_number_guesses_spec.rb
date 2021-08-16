require 'rails_helper'

RSpec.describe SuppliesThreeChapterNumberGuesses do
    describe ".guesses" do
        it "returns an array of three guesses for each chapter of the new testament" do
            (40..66).each do |book_number|
                max_chapters = MaxNumVersesChaptersLookup.get_max_chapters(book_number)
                (1..max_chapters).each do |chapter_number|
                    guesses = SuppliesThreeChapterNumberGuesses.new(book_number, chapter_number).guesses
                    expect(guesses.length).to eq 3
                    expect(guesses.uniq.length).to eq 3
                    expect(guesses).not_to include chapter_number
                    expect(guesses.all? { |i| i.is_a?(Integer) }).to eq true
                end
            end
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