import React from 'react';
import GameSession from '../GameSession';
import data from './assets/data/game_session_fixture';

export default {
  title: 'GameSession',
  component: GameSession,
};

const Template = args => <GameSession {...args} />;

const game_session_fixture = {
  game_rounds: [],
  game_session_scores: [],
  chat_messages: [],
};

export const Small = Template.bind({});
Small.args = {
  game_session: game_session_fixture,
};
