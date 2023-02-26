class PullsRandomVerseReferences

  def initialize(number_to_pull = 45)
    @number_to_pull = number_to_pull
  end

  def pull
    references.sample(@number_to_pull)
  end

  private

  def references
    verse_file = File.join(Rails.root, 'db', 'fixtures', '520verses.txt')
    File.readlines(verse_file).map(&:strip)
  end
end
