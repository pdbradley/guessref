require 'net/http'
require 'uri'
class LsmVerseRetriever

  ENDPOINT = 'https://api.lsm.org/recver.php'


  def retrieve(reference)
    params = { String: reference, Out: 'json' }

    uri = URI.parse(ENDPOINT)
    uri.query = URI.encode_www_form(params)
    @result = Net::HTTP.get(uri)
  end

  def invalid?
    first_verse_ref.empty? || (first_verse_text == "No such reference")
  end

  def valid?
    !invalid?
  end

  def text
    first_verse_text
  end

  private

  def result_json
    JSON.parse(@result)
  end

  def first_verse_ref
    result_json["verses"].first["ref"]
  end

  def first_verse_text
    result_json["verses"].first["text"]
  end

  def params
  end

end
