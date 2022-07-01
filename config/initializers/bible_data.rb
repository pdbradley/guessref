require "#{Rails.root}/app/models/concerns/builds_book_number_keyed_hash.rb"
BIBLE_DATA = BuildsBookNumberKeyedHash.new.hash
