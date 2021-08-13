import React from 'react';
import 'bulma/css/bulma.min.css';
import {Section, Heading} from 'react-bulma-components';

const GameSessionScores = ({game_session_scores}) => {
  return (
    <Section>
      <Heading>Scores</Heading>
      {game_session_scores.map(gss => (
        <Heading>
          {gss.user.name}:{gss.score}
        </Heading>
      ))}
    </Section>
  );
};

export default GameSessionScores;
