class BuildsBookNumberKeyedHash

  # this rather obtuse class takes the json file found in lib/support/bible.json
  # (forked from somewhere on github) and converts it into a useful format.
  #
  # In order to generate believable choices, I need to know the max chapter number per 
  # book and the max verse number per chapter.  this hash gets me halfway there.

  def hash
    @@hash ||= build_hash  #hopefully the @@ means this won't get built again and again
  end

  def build
    file_path = File.join(Rails.root, 'lib', 'support', 'bible.json')
    file = File.open(file_path)

    stuff = JSON.parse(file.read)

    hash_keyed_on_book_number = Hash[stuff.map do |item| 
      [item['book_number'], 
       Hash[item['chapters'].map{|chapters| [chapters['chapter'], chapters['verses']]}]
      ]
    end]
  end
end
