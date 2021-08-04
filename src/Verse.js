import React from 'react';
import 'bulma/css/bulma.min.css';
import {Container, Heading} from 'react-bulma-components';
import VerseWord from './VerseWord';

const Verse = ({verse}) => {
  if (!verse) {
    return <div>No Verse</div>;
  }
  return (
    <div className="content">
      {verse.verse_words.map(({word_text, visible}) => (
        <VerseWord wordText={word_text} visible={visible} />
      ))}
    </div>
  );
};

export default Verse;
