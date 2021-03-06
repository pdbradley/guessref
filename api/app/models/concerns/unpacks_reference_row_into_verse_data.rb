class UnpacksReferenceRowIntoVerseData

  attr_reader :book_number, :chapter_number, :verse_number, :reference, :text, :verse_words

  def initialize(row)
    @row = row
    unpack_line
    retrieve_verse
  end

  def valid?
    @valid
  end

  private

  def unpack_line
    @book_number, @chapter_number, @verse_number, @reference = @row.split(',')
  end

  def retrieve_verse
    retriever = LsmVerseRetriever.new
    puts "RETRIEVING #{@reference}"
    retriever.retrieve(@reference)
    if retriever.valid?
      @text = retriever.text 
      @valid = true
    else
      @valid = false
    end
  end

end
