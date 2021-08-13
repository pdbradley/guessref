import React from 'react';
import 'bulma/css/bulma.min.css';
import { Section, Box, Tile, Heading } from 'react-bulma-components';
import JoinGameButton from './JoinGameButton';
import NewGame from './NewGame';

const GamesList = ({ game_sessions }) => {
  return (
    <Section>
      <Tile kind="ancestor" textAlign="center" vertical>
        <Box>
          <NewGame />
        </Box>
        {game_sessions.map(gs => (
          <Box>
            <Tile vertical>
              <Tile>
                <Tile kind="parent">
                  <Tile kind="child">
                    <Heading>{gs.name}, Game {gs.id}, Status {gs.status}</Heading>
                    <Heading subtitle>{gs.participants_aggregate.aggregate.count} Participants, {gs.game_rounds_aggregate.aggregate.count} Rounds, {gs.game_rounds.reduce((accumulator, item) =>
                      accumulator + item.verses_aggregate.aggregate.count, 0)} Total Verses</Heading>
                  </Tile>
                </Tile>
                <Tile kind="parent">
                  <Tile kind="child">
                    <JoinGameButton game_session_uuid={gs.uuid} />
                  </Tile>
                </Tile>
              </Tile>
            </Tile>
          </Box>
        ))}
      </Tile>
    </Section>
  );
};

export default GamesList;
