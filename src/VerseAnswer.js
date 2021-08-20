import React from 'react';
import 'bulma/css/bulma.min.css';
import BookLabelFromNumber from './BookLabelFromNumber';
import { Heading } from 'react-bulma-components';
import { Fragment } from 'react';

const VerseAnswers = ({ book, chapter, verse }) => {
  
  return (
    <Fragment>
      <BookLabelFromNumber book_number={book}/>
      <Heading>{chapter}:{verse}</Heading>
    </Fragment>
  );
};

export default VerseAnswers;