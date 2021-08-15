class SuppliesThreeChapterNumberGuesses
    def initialize(chapter_number)
        @chapter_number = chapter_number
    end

    def guesses
        sample_from_array = ([*(@chapter_number-5)..(@chapter_number+5)] - [@chapter_number])
                            .select{ |number| number > 0 }
        sample_from_array.sample(3)
    end
end