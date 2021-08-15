class SuppliesThreeChapterNumberGuesses
    
    def initialize(book_number, chapter_number)
        @book_number = book_number
        @chapter_number = chapter_number
    end

    def guesses
        max_chapters = MaxNumVersesChaptersLookup.get_max_chapters(@book_number)
        sample_from_array = ([*(@chapter_number-5)..(@chapter_number+5)] - [@chapter_number])
                            .select{ |n| n > 0 && n < max_chapters }
        sample_from_array.sample(3)
    end
end