import React from 'react';
import 'bulma/css/bulma.min.css';
import { Section, Heading } from 'react-bulma-components';

const GameSessionScores = ({ game_session_scores }) => {
  const combinedScores = game_session_scores.reduce((accumulator, item) => {
    let found = false;
    for (let i = 0; i < accumulator.length; i++) {
      if (accumulator[i].user_uuid === item.user_uuid) {
        found = true;
        accumulator[i].score += item.score;
      };
    }
    if (!found) {
      accumulator.push(item);
    }
    return accumulator;
  }, []);

  return (
    <Section>
      <Heading>Scores</Heading>
      {combinedScores.map(gss => (
        <Heading>
          {gss.user.name}:{gss.score}
        </Heading>
      ))}
    </Section>
  );
};

export default GameSessionScores;
