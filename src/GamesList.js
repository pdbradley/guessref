import React from 'react';
import 'bulma/css/bulma.min.css';
import { Tile } from 'react-bulma-components';
import { Link } from 'react-router-dom';

const GamesList = ({ game_sessions }) => {
  return (
    <div>
      {game_sessions.map(gs => (
        <Tile>
          <Link to={`/game/${gs.uuid}`}>
            Game {gs.id} {gs.uuid}
          </Link>
        </Tile>
      ))}
    </div>
  );
};

export default GamesList;
