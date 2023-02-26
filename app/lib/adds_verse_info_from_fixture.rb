class AddsVerseInfoFromFixture

  def initialize(verse)
    @verse = verse
  end

  def fill_in_verse_with_random_info
    verse_file = File.join(Rails.root, 'db', 'fixtures', 'verses.txt')
    verse_row = File.readlines(verse_file).sample.strip.split(',',4)

    @verse.book_number = verse_row[0]
    @verse.chapter_number = verse_row[1]
    @verse.verse_number = verse_row[2]
    @verse.save!
    verse_row[3].split(' ').each do |word|
      @verse.verse_words.create(word_text: word, visible: false)
    end

    @verse.add_answers!
  end
end
