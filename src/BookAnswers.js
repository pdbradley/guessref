import React from 'react';
import 'bulma/css/bulma.min.css';
import { Tile, Section, Box, Notification } from 'react-bulma-components';
import BookLabelFromNumber from './BookLabelFromNumber';

const BookAnswers = ({ book_answers }) => {
  return (
    <Section>
      <Box>
        <Tile>
          <Tile kind="parent" vertical>
            <Tile kind="child" renderAs={Notification} color="success" textAlign="center">
              <BookLabelFromNumber book_number={book_answers[0].book_number} />
            </Tile>
            <Tile kind="child" renderAs={Notification} color="success" textAlign="center">
              <BookLabelFromNumber book_number={book_answers[1].book_number} />
            </Tile>
          </Tile>
          <Tile kind="parent" vertical>
            <Tile kind="child" renderAs={Notification} color="success" textAlign="center">
              <BookLabelFromNumber book_number={book_answers[2].book_number} />
            </Tile>
            <Tile kind="child" renderAs={Notification} color="success" textAlign="center">
              <BookLabelFromNumber book_number={book_answers[3].book_number} />
            </Tile>
          </Tile>
        </Tile>
      </Box>
    </Section>
  );
};

export default BookAnswers;