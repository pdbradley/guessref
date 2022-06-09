require 'rails_helper'

RSpec.describe LsmVerseRetriever do
  # this spec is baaaad because it actually hits the api but whatev
  # describe "#retrieve" do
  #   it "populates the result with verse attributes when valid" do
  #     retriever = LsmVerseRetriever.new
  #     retriever.retrieve("Matthew 1:1")
  #     expect(retriever.valid?).to be_truthy
  #     expect(retriever.text).to match(/generation/)
  #   end
  #   it "detects an invalid reference" do
  #     retriever = LsmVerseRetriever.new
  #
  #     retriever.retrieve("Nargh")
  #     expect(retriever.valid?).to be_falsey
  #   end
  # end
end

# valid JSON response for one verse:
#
# {"inputstring"=>"Matthew 1:1", "detected"=>"Matt. 1:1.", "verses"=>[{"ref"=>"Matt. 1:1", "text"=>"The book of the generation of Jesus Christ, the son of David, the son of Abraham:"}], "message"=>"", "copyright"=>"Verses accessed from the Holy Bible Recovery Version (text-only edition) © 2012 Living Stream Ministry www.lsm.org"}
#
#
# INVALID reference JSON
#
#{"inputstring"=>"Nargh", "detected"=>" .", "verses"=>[{"ref"=>" :", "text"=>"No such reference"}], "message"=>"", "copyright"=>"Verses accessed from the Holy Bible Recovery Version (text-only edition) © 2012 Living Stream Ministry www.lsm.org"}
