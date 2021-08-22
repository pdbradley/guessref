import React from 'react';
import 'bulma/css/bulma.min.css';
import { Panel } from 'react-bulma-components';

const GameSessionScores = ({ game_session_scores }) => {
  let combinedScores = game_session_scores.reduce(function (a, o) {
    a[o.user.name] = a[o.user.name] || { score: 0 };
    a[o.user.name].user_uuid = o.user_uuid;
    a[o.user.name].user_name = o.user.name;
    a[o.user.name].score += o.score;
    return a;
  }, Object.create(null));

  let sortedScores = Object.keys(combinedScores).sort().reduce((r, k) => (r[k] = combinedScores[k], r), {});

  return (
    <Panel>
      <Panel.Header>Scores</Panel.Header>
      {Object.values(sortedScores).map(({ user_uuid, user_name, score }) => (
        <Panel.Block key={user_uuid}>
          {user_name}:{" "}{score}
        </Panel.Block>
      ))}
    </Panel>
  );
};

export default GameSessionScores;
