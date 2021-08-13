import React from 'react';
import GameSessionScores from '../GameSessionScores';

export default {
  title: 'GameSessionScores',
  component: GameSessionScores,
};

const Template = args => <GameSessionScores {...args} />;

export const JC_winning = Template.bind({});
JC_winning.args = {
  game_session_scores: [
    {
      "user_uuid": "accd5ce4-fc2d-11eb-9ddc-0242ac140002",
      "score": 500,
      "user": {
        "name": "JC"
      }
    },
    {
      "user_uuid": "f33f7d88-fc2d-11eb-a3e7-0242ac140002",
      "score": 300,
      "user": {
        "name": "Dinushka"
      }
    }
  ]
};
