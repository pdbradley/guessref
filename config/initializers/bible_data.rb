require "#{Rails.root}/app/lib/builds_book_number_keyed_hash.rb"
BIBLE_DATA = BuildsBookNumberKeyedHash.new.hash
