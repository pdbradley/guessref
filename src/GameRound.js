import React from 'react';
import 'bulma/css/bulma.min.css';
import Verse from './Verse';
import BookChapterVerseAnswers from './BookChapterVerseAnswers';

const GameRound = ({ gameRound }) => {
  if (!gameRound) {
    return <div>No Game Round</div>;
  }
  let verse = gameRound.verses[0];
  return (
    <>
      <Verse verse={verse} />
      <BookChapterVerseAnswers key={verse && verse.id} verse={verse} />
    </>
  );
};

export default GameRound;
