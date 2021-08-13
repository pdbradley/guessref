import React from 'react';
import 'bulma/css/bulma.min.css';
import { Section, Box, Tile, Heading } from 'react-bulma-components';

const GameSessionScores = ({ game_session_scores }) => {
  return (
    <Section>
      <Tile kind="parent" vertical>
        <Box>
          <Tile kind="parent">
            {game_session_scores.map(gss => (
              <Tile kind="child" textAlign="center">
                <Heading>{gss.user.name}</Heading>
                <Heading>Score: {gss.score}</Heading>
              </Tile>
            ))}
          </Tile>
        </Box>
      </Tile>
    </Section>
  );
};

export default GameSessionScores;
