import React from 'react';
import 'bulma/css/bulma.min.css';
import {Container, Heading} from 'react-bulma-components';
import GameRound from './GameRound';

const GameSession = ({game_session}) => {
  if (!game_session) {
    return <div>No Session</div>;
  }

  console.log(game_session);
  return <GameRound gameRound={game_session.game_rounds[0]} />;
};

export default GameSession;
