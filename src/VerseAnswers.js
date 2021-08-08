import React from 'react';
import 'bulma/css/bulma.min.css';
import { Heading, Tile, Section, Box, Notification } from 'react-bulma-components';

const VerseAnswers = ({ verse_answers }) => {
  return (
    <Section>
      <Box>
        <Tile>
          <Tile kind="parent" vertical>
            <Tile kind="child" renderAs={Notification} color="success" textAlign="center">
              <Heading>{verse_answers[0].label}</Heading>
            </Tile>
            <Tile kind="child" renderAs={Notification} color="success" textAlign="center">
              <Heading>{verse_answers[1].label}</Heading>
            </Tile>
          </Tile>
          <Tile kind="parent" vertical>
            <Tile kind="child" renderAs={Notification} color="success" textAlign="center">
              <Heading>{verse_answers[2].label}</Heading>
            </Tile>
            <Tile kind="child" renderAs={Notification} color="success" textAlign="center">
              <Heading>{verse_answers[3].label}</Heading>
            </Tile>
          </Tile>
        </Tile>
      </Box>
    </Section>
  );
};

export default VerseAnswers;