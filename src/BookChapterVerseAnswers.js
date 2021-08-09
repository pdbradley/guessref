import React, { useState } from 'react';
import 'bulma/css/bulma.min.css';
import { Section, Box } from 'react-bulma-components';
import BookAnswers from './BookAnswers';
import VerseAnswers from './VerseAnswers';

const BookChapterVerseAnswers = ({ book_answers, chapter_answers, verse_answers }) => {

  const [points, setPoints] = useState(0);
  const [showAnyThing, setShowAnyThing] = useState(true);
  const [showBookAnswers, setShowBookAnswers] = useState(true);
  const [showChapterAnswers, setShowChapterAnswers] = useState(false);
  const [showVerseAnswers, setShowVerseAnswers] = useState(false);

  function handleBookAnswerClick(clickedAnswer) {
    setPoints(points + clickedAnswer.point_value)
    if (clickedAnswer.correct) {
      setShowBookAnswers(false);
      setShowChapterAnswers(true);
    } else {
      setShowAnyThing(false);
    }
  }

  function handleChapterAnswerClick(clickedAnswer) {
    setPoints(points + clickedAnswer.point_value)
    if (clickedAnswer.correct) {
      setShowChapterAnswers(false);
      setShowVerseAnswers(true);
    } else {
      setShowAnyThing(false);
    }
  }

  function handleVerseAnswerClick(clickedAnswer) {
    setPoints(points + clickedAnswer.point_value)
    setShowAnyThing(false);
  }

  return (
    <>
      {showAnyThing && <Section>
        <Box>
          {showBookAnswers && <BookAnswers onAnswerClicked={handleBookAnswerClick} book_answers={book_answers} />}
          {showChapterAnswers && <VerseAnswers onAnswerClicked={handleChapterAnswerClick} verse_answers={chapter_answers} />}
          {showVerseAnswers && <VerseAnswers onAnswerClicked={handleVerseAnswerClick} verse_answers={verse_answers} />}
        </Box>
      </Section>}
    </>
  );
};

export default BookChapterVerseAnswers;