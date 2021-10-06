import React from 'react';
import 'bulma/css/bulma.min.css';
import Verse from './Verse';
import BookChapterVerseAnswers from './BookChapterVerseAnswers';
import Cookies from 'universal-cookie';

const GameRound = ({ gameRound }) => {
  const cookies = new Cookies();
  if (!gameRound) {
    return <div>Get ready!</div>;
  }
  let verse = gameRound.verses[0];

  if (verse) {
    const verse_id = cookies.get('verse_id');
    const current_verse_id = verse.id;

    if (verse_id != current_verse_id) {
      cookies.set('answers', 'NONE', { path: '/' });
      cookies.set('new_verse_time', Date.now(), { path: '/' });
      cookies.set('verse_id', current_verse_id, { path: '/' });
    }

    if (verse.status === 'REVEALED') {
      cookies.set('answers', 'ANSWER_DONE', { path: '/' });
      return <Verse verse={verse} />;
    }
  }
  return (
    <>
      <Verse verse={verse} />
      <BookChapterVerseAnswers key={verse && verse.id} verse={verse} />
    </>
  );
};

export default GameRound;
