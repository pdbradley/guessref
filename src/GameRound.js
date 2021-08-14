import React from 'react';
import 'bulma/css/bulma.min.css';
import Verse from './Verse';
import BookChapterVerseAnswers from './BookChapterVerseAnswers';

const GameRound = ({ gameRound }) => {
  if (!gameRound) {
    return <div>No Game Round</div>;
  }
  return (
    <>
      <Verse verse={gameRound.verses[0]} />
      <BookChapterVerseAnswers verse={gameRound.verses[0]} />
    </>
  );
};

export default GameRound;
