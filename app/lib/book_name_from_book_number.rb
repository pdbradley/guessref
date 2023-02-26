class BookNameFromBookNumber
  def initialize(num)
    @num = num
  end

  def name
    BIBLE_DATA[@num.to_i]['book_name']
  end

end
