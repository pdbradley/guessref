import React from 'react';
import 'bulma/css/bulma.min.css';
import { Section } from 'react-bulma-components';
import GameRound from './GameRound';
import LeaveGameButton from './LeaveGameButton';


const GameSession = ({ game_session }) => {
  if (!game_session) {
    return <div>No Session</div>;
  }

  return (
    <>
      <Section textAlign="center">
        <GameRound gameRound={game_session.game_rounds[0]} />
      </Section>
      <Section textAlign="center">
        <LeaveGameButton />
      </Section>
    </>
  );
};

export default GameSession;
