import React from 'react';
import 'bulma/css/bulma.min.css';
import { Tile, Notification } from 'react-bulma-components';
import BookLabelFromNumber from './BookLabelFromNumber';

const BookAnswers = ({ onAnswerClicked, book_answers }) => {
  function handleClick(answer) {
    onAnswerClicked(book_answers[answer])
  }

  return (
    <Tile>
      <Tile kind="parent" vertical>
        <Tile style={{ padding: "5px 0px" }} kind="child" onClick={() => handleClick(0)} renderAs={Notification} color="success" textAlign="center">
          <BookLabelFromNumber book_number={book_answers[0].label} />
        </Tile>
        <Tile style={{ padding: "5px 0px" }} kind="child" onClick={() => handleClick(1)} renderAs={Notification} color="success" textAlign="center">
          <BookLabelFromNumber book_number={book_answers[1].label} />
        </Tile>
      </Tile>
      <Tile kind="parent" vertical>
        <Tile style={{ padding: "5px 0px" }} kind="child" onClick={() => handleClick(2)} renderAs={Notification} color="success" textAlign="center">
          <BookLabelFromNumber book_number={book_answers[2].label} />
        </Tile>
        <Tile style={{ padding: "5px 0px" }} kind="child" onClick={() => handleClick(3)} renderAs={Notification} color="success" textAlign="center">
          <BookLabelFromNumber book_number={book_answers[3].label} />
        </Tile>
      </Tile>
    </Tile>
  );
};

export default BookAnswers;