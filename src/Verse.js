import React from 'react';
import 'bulma/css/bulma.min.css';
import VerseWord from './VerseWord';
import VerseAnswer from './VerseAnswer';

const Verse = ({ verse }) => {
  if (!verse) {
    return <div>Waiting on Verse</div>;
  }
  if (verse.status === 'REVEALED') {
    return <VerseAnswer verse={verse} />;
  }
  return (
    <div className="content">
      {verse.verse_words.map(({ id, word_text, visible }) => (
        <VerseWord key={id} wordText={word_text} visible={visible} />
      ))}
    </div>
  );
};

export default Verse;
