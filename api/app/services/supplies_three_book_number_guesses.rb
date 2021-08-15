class SuppliesThreeBookNumberGuesses

  GENESIS = 1
  EXODUS = 2
  LEVITICUS = 3
  NUMBERS = 4
  DEUTERONOMY = 5
  MATTHEW = 40
  MARK = 41
  LUKE = 42
  JOHN = 43
  ACTS = 44
  ROMANS = 45
  CORINTHIANS1 = 46
  CORINTHIANS2 = 47
  GALATIANS = 48
  EPHESIANS = 49
  PHILIPPIANS = 50
  COLOSSIANS = 51
  THESSALONIANS1 = 52
  THESSALONIANS2 = 53
  TIMOTHY1 = 54
  TIMOTHY2 = 55
  TITUS = 56
  PHILEMON = 57
  HEBREWS = 58
  JAMES = 59
  PETER1 = 60
  PETER2 = 61
  JOHN1 = 62
  JOHN2 = 63
  JOHN3 = 64
  JUDE = 65
  REVELATION = 66


  PENTATEUCH = [GENESIS, EXODUS, LEVITICUS, NUMBERS, DEUTERONOMY]
  GOSPELS = [MATTHEW, MARK, LUKE, JOHN]
  HEART = [GALATIANS, EPHESIANS, PHILIPPIANS, COLOSSIANS]
  PAUL_EP = [ROMANS, CORINTHIANS1, CORINTHIANS2, GALATIANS, EPHESIANS, PHILIPPIANS, COLOSSIANS,
  THESSALONIANS1, THESSALONIANS2, TIMOTHY1, TIMOTHY2, TITUS, PHILEMON, HEBREWS]
  JOHN_EP = [JOHN1, JOHN2, JOHN3]
  PETER_EP = [PETER1, PETER2]
  ALL_EP = PAUL_EP + JOHN_EP + PETER_EP + [JUDE, JAMES]
  ALL = PAUL_EP + JOHN_EP + PETER_EP + [JUDE, JAMES, ACTS, REVELATION] + GOSPELS
    
  def initialize(book_number)
    @book_number = book_number
  end

  def guesses # this method will be huge
    case @book_number
    when GENESIS
      (PENTATEUCH - GENESIS).sample(3)
    when EXODUS
      (PENTATEUCH - EXODUS).sample(3)
    when LEVITICUS
      (PENTATEUCH - LEVITICUS).sample(3)
    when NUMBERS
      (PENTATEUCH - NUMBERS).sample(3)
    when DEUTERONOMY
      (PENTATEUCH - DEUTERONOMY).sample(3)
    when MATTHEW
      (GOSPELS - [MATTHEW]).sample(3)
    when MARK
      (GOSPELS - [ MARK ]).sample(3)
    when LUKE
      (GOSPELS - [ LUKE ]).sample(3)
    when JOHN
      (GOSPELS - [ JOHN ]).sample(3)
    when ACTS
      (ALL - [ ACTS ]).sample(3)
    when ROMANS
      (PAUL_EP - [ ROMANS ]).sample(3)
    when CORINTHIANS1
      (PAUL_EP - [ CORINTHIANS1 ]).sample(3)
    when CORINTHIANS2
      (PAUL_EP - [ CORINTHIANS2 ]).sample(3)
    when GALATIANS
      (HEART - [ GALATIANS ]).sample(3)
    when EPHESIANS
      (HEART - [ EPHESIANS ]).sample(3)
    when PHILIPPIANS
      (HEART - [ PHILIPPIANS ]).sample(3)
    when COLOSSIANS
      (HEART - [ COLOSSIANS ]).sample(3)
    when THESSALONIANS1
      (PAUL_EP - [ THESSALONIANS1 ]).sample(3)
    when THESSALONIANS2
      (PAUL_EP - [ THESSALONIANS2 ]).sample(3)
    when TIMOTHY1
      (PAUL_EP - [ TIMOTHY1 ]).sample(3)
    when TIMOTHY2
      (PAUL_EP - [ TIMOTHY2 ]).sample(3)
    when TITUS
      (PAUL_EP - [ TITUS ]).sample(3)
    when PHILEMON
      (PAUL_EP - [ PHILEMON ]).sample(3)
    when HEBREWS
      (PAUL_EP - [ HEBREWS ]).sample(3)
    when JAMES
      ([HEBREWS] + PETER_EP + [JUDE] + JOHN_EP).sample(3)
    when PETER1
      ( (PETER_EP + [JUDE] + JOHN_EP + [JAMES])-[ PETER1 ]).sample(3)
    when PETER2
      ( (PETER_EP + [JUDE] + JOHN_EP + [JAMES])-[ PETER2 ]).sample(3)
    when JOHN1
      (([JUDE] + JOHN_EP) - [ JOHN1 ]).sample(3)
    when JOHN2
      (([JUDE] + JOHN_EP) - [ JOHN2 ]).sample(3)
    when JOHN3
      (([JUDE] + JOHN_EP) - [ JOHN3 ]).sample(3)
    when JUDE
      (PETER_EP + JOHN_EP).sample(3)
    when REVELATION
      (ALL).sample(3)
    end
  end
end
