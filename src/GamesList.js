import React from 'react';
import 'bulma/css/bulma.min.css';
import {Section, Box, Tile} from 'react-bulma-components';
import JoinGameButton from './JoinGameButton';
import NewGame from './NewGame';

const GamesList = ({game_sessions}) => {
  return (
    <Section>
      <Tile kind="parent" vertical>
        <Tile kind="child" textAlign="center">
          <Box>
            <NewGame />
          </Box>
        </Tile>
        {game_sessions.map(gs => (
          <Box>
            <Tile kind="parent">
              <Tile kind="child" textAlign="center">
                Game {gs.id} {gs.name}
              </Tile>
              <Tile kind="child" textAlign="center">
                <JoinGameButton game_session_uuid={gs.uuid} />
              </Tile>
            </Tile>
          </Box>
        ))}
      </Tile>
    </Section>
  );
};

export default GamesList;
