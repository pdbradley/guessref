import React from 'react';
import 'bulma/css/bulma.min.css';
import { Heading, Tile, Section, Box, Notification } from 'react-bulma-components';

const VerseAnswers = ({ onAnswerClicked, verse_answers }) => {
  function handleClick(answer) {
    onAnswerClicked(verse_answers[answer])
  }

  return (
    <Section>
      <Box>
        <Tile>
          <Tile kind="parent" vertical>
            <Tile kind="child" onClick={() => handleClick(0)} renderAs={Notification} color="success" textAlign="center">
              <Heading>{verse_answers[0].label}</Heading>
            </Tile>
            <Tile kind="child" onClick={() => handleClick(1)} renderAs={Notification} color="success" textAlign="center">
              <Heading>{verse_answers[1].label}</Heading>
            </Tile>
          </Tile>
          <Tile kind="parent" vertical>
            <Tile kind="child" onClick={() => handleClick(2)} renderAs={Notification} color="success" textAlign="center">
              <Heading>{verse_answers[2].label}</Heading>
            </Tile>
            <Tile kind="child" onClick={() => handleClick(3)} renderAs={Notification} color="success" textAlign="center">
              <Heading>{verse_answers[3].label}</Heading>
            </Tile>
          </Tile>
        </Tile>
      </Box>
    </Section>
  );
};

export default VerseAnswers;