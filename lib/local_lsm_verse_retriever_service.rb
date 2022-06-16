# this class is a sort of stub class so that in testing (and maybe development if we make this class better)
# we don't have to keep hammering the lsm api.  I'll set a config var for the test environment that swaps
# this service class in for the 'real' one that hits LSM
# So this retriever will return one of the verses below no matter what the supplied reference is, even if it is crazy

class LocalLsmVerseRetrieverService

  def retrieve(reference)
  end

  def invalid?
    false
  end

  def valid?
    true
  end

  def text
    [
     'In the beginning was the Word, and the Word was with God, and the Word was God.',
     'He was in the beginning with God.',
     'All things came into being through Him, and apart from Him not one thing came into being which has come into being.',
     'In Him was life, and the life was the light of men.',
     'And the light shines in the darkness, and the darkness did not overcome it.',
     'There came a man sent from God, whose name was John.',
     'He came for a testimony that he might testify concerning the light, that all might believe through him.',
     'He was not the light, but came that he might testify concerning the light.',
     'This was the true light which, coming into the world, enlightens every man.',
     'He was in the world, and the world came into being through Him, yet the world did not know Him.',
     'He came to His own, yet those who were His own did not receive Him.',
     'Who were begotten not of blood, nor of the will of the flesh, nor of the will of man, but of God.',
     'And the Word became flesh and tabernacled among us (and we beheld His glory, glory as of the only Begotten from the Father), full of grace and reality.',
     'John testified concerning Him and cried out, saying, This was He of whom I said, He who is coming after me has become ahead of me, because He was before me.',
     'For of His fullness we have all received, and grace upon grace.'
    ].sample
  end

end

