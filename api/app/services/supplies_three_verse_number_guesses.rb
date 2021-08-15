class SuppliesThreeVerseNumberGuesses
    def initialize(verse_number)
        @verse_number = verse_number
    end

    def guesses
        sample_from_array = ([*(@verse_number-5)..(@verse_number+5)] - [@verse_number])
                            .select{ |number| number > 0 }
        sample_from_array.sample(3)
    end
end