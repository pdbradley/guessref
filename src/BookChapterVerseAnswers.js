import React, { useState } from 'react';
import 'bulma/css/bulma.min.css';
import BookAnswers from './BookAnswers';
import VerseAnswers from './VerseAnswers';

const BookChapterVerseAnswers = ({ verse }) => {
  const [points, setPoints] = useState(0);
  const [showAnyThing, setShowAnyThing] = useState(true);
  const [showBookAnswers, setShowBookAnswers] = useState(true);
  const [showChapterAnswers, setShowChapterAnswers] = useState(false);
  const [showVerseAnswers, setShowVerseAnswers] = useState(false);

  if (!verse) {
    return <></>;
  }

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
      {showAnyThing && <>
        {showBookAnswers && <BookAnswers onAnswerClicked={handleBookAnswerClick} book_answers={verse.book_answers} />}
        {showChapterAnswers && <VerseAnswers onAnswerClicked={handleChapterAnswerClick} verse_answers={verse.chapter_answers} />}
        {showVerseAnswers && <VerseAnswers onAnswerClicked={handleVerseAnswerClick} verse_answers={verse.verse_answers} />}
      </>}
    </>
  );
};

export default BookChapterVerseAnswers;