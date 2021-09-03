import React from 'react';
import 'bulma/css/bulma.min.css';
import BookLabelFromNumber from './BookLabelFromNumber';
import { Heading } from 'react-bulma-components';
import { Fragment } from 'react';

const VerseAnswers = ({ verse }) => {
  let book_answer = verse.book_answers.filter(ba => ba.correct)[0].label;
  let chapter_answer = verse.chapter_answers.filter(ca => ca.correct)[0].label;
  let verse_answer = verse.verse_answers.filter(va => va.correct)[0].label;


  return (
    <Fragment>
      <BookLabelFromNumber book_number={book_answer} />
      <Heading>{chapter_answer}:{verse_answer}</Heading>
    </Fragment>
  );
};

export default VerseAnswers;