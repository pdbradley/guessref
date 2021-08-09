import React, { useState } from 'react';
import 'bulma/css/bulma.min.css';
import { Heading, Tile, Section, Box, Notification } from 'react-bulma-components';
import BookAnswers from './BookAnswers';
import VerseAnswers from './VerseAnswers';

const BookChapterVerseAnswers = ({ book_answers, chapter_answers, verse_answers }) => {

  const [points, setPoints] = useState(0);
  const [showAnyThing, showAny] = useState(true);
  const [showBookAnswers, showBook] = useState(true);
  const [showChapterAnswers, showChapter] = useState(false);
  const [showVerseAnswers, showVerse] = useState(false);

  function handleClick(clickedAnswer, whoCalledMe) {
    setPoints(points + clickedAnswer.point_value)

    if (whoCalledMe == "BookAnswers" && clickedAnswer.correct) {
      showBook(false);
      showChapter(true);
    }
    else if (whoCalledMe == "BookAnswers") {
      showAny(false);
    }

    if (whoCalledMe == "ChapterAnswers" && clickedAnswer.correct) {
      showChapter(false);
      showVerse(true);
    }
    else if (whoCalledMe == "ChapterAnswers") {
      showAny(false);
    }

    if (whoCalledMe == "VerseAnswers") {
      showAny(false);
    }
  }

  return (
    <>
      {showAnyThing && <Section>
        <Box>
          {showBookAnswers && <BookAnswers onAnswerClicked={(clickedAnswer) => handleClick(clickedAnswer, "BookAnswers")} book_answers={book_answers} />}
          {showChapterAnswers && <VerseAnswers onAnswerClicked={(clickedAnswer) => handleClick(clickedAnswer, "ChapterAnswers")} verse_answers={chapter_answers} />}
          {showVerseAnswers && <VerseAnswers onAnswerClicked={(clickedAnswer) => handleClick(clickedAnswer, "VerseAnswers")} verse_answers={verse_answers} />}
        </Box>
      </Section>}
    </>
  );
};

export default BookChapterVerseAnswers;