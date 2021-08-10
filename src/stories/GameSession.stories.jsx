import React from 'react';
import GameSession from '../GameSession';
import data from './assets/data/game_session_fixture';

export default {
  title: 'GameSession',
  component: GameSession,
};

const Template = args => <GameSession {...args} />;

export const Small = Template.bind({});
Small.args = {
  game_session: data.game_sessions[0],
};
