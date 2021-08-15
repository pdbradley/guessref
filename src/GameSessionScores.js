import React from 'react';
import 'bulma/css/bulma.min.css';
import { Panel } from 'react-bulma-components';

const GameSessionScores = ({ game_session_scores }) => {
  let combinedScores = game_session_scores.reduce(function (a, o) {
    a[o.user_uuid] = a[o.user_uuid] || { score: 0 };
    a[o.user_uuid].user_uuid = o.user_uuid;
    a[o.user_uuid].user_name = o.user.name;
    a[o.user_uuid].score += o.score;
    return a;
  }, Object.create(null));

  return (
    <Panel>
      <Panel.Header>Scores</Panel.Header>
      {Object.values(combinedScores).map(({ user_uuid, user_name, score }) => (
        <Panel.Block key={user_uuid}>
          {user_name}:{" "}{score}
        </Panel.Block>
      ))}
    </Panel>
  );
};

export default GameSessionScores;
