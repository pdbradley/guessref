import React from 'react';
import 'bulma/css/bulma.min.css';
import { Section } from 'react-bulma-components';
import GameRound from './GameRound';
import LeaveGameButton from './LeaveGameButton';
import GameSessionScores from './GameSessionScores';


const GameSession = ({ game_session }) => {
  if (!game_session) {
    return <div>No Session</div>;
  }
  let hasScores = game_session.game_session_scores.length !== 0;

  return (
    <>
      <Section textAlign="center">
        <GameRound gameRound={game_session.game_rounds[0]} />
      </Section>
      {hasScores && <Section>
        <GameSessionScores game_session_scores={game_session.game_session_scores} />
      </Section>}
      <Section textAlign="center">
        <LeaveGameButton />
      </Section>
    </>
  );
};

export default GameSession;
