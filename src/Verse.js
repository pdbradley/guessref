import React from 'react';
import 'bulma/css/bulma.min.css';
import {Container, Heading} from 'react-bulma-components';
import VerseWord from './VerseWord';

const Verse = ({verseWords}) => {
  return (
    <Container>
      <div class="content">
        {verseWords.map(({wordText, visible}) => (
          <VerseWord wordText={wordText} visible={visible} />
        ))}
      </div>
    </Container>
  );
};

export default Verse;
