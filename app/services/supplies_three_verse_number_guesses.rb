class SuppliesThreeVerseNumberGuesses
    def initialize(book_number, chapter_number, verse_number)
        @book_number = book_number
        @chapter_number = chapter_number
        @verse_number = verse_number
    end

    def guesses
        max_verses = MaxNumVersesChaptersLookup.get_max_verses(@book_number, @chapter_number)
        if max_verses < 4
            return [1,2,3,4] - [@verse_number]
        end
        sample_from_array = ([*(@verse_number-5)..(@verse_number+5)] - [@verse_number])
            .select{ |n| n > 0 && n <= max_verses }
        sample_from_array.sample(3)
    end
end