import React from 'react';
import 'bulma/css/bulma.min.css';
import { Container, Heading, Tile } from 'react-bulma-components';
import Verse from './Verse';
import { Link } from 'react-router-dom';

const GamesList = ({ game_sessions }) => {
  return (
    <div>
      {game_sessions.map(e => (
        <Tile>
          <Link to={`/game/${e.uuid}`}>
            Game {e.id} {e.uuid}
          </Link>
        </Tile>
      ))}
    </div>
  );
};

export default GamesList;
