class MaxNumVersesChaptersLookup

    def self.get_max_chapters(book_number)
        book_number = book_number.to_i
        BIBLE_DATA[book_number]['chapters'].size
    end

    def self.get_max_verses(book_number, chapter_number)
        book_number = book_number.to_i
        chapter_number = chapter_number.to_i
        BIBLE_DATA[book_number]['chapters'][chapter_number]
    end
end
