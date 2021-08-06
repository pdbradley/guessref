import React from 'react';
import 'bulma/css/bulma.min.css';
import {Container, Heading, Section} from 'react-bulma-components';
import GameRound from './GameRound';

const GameSession = ({game_session}) => {
  if (!game_session) {
    return <div>No Session</div>;
  }

  return (
    <Section textAlign="center">
      <GameRound gameRound={game_session.game_rounds[0]} />
    </Section>
  );
};

export default GameSession;
