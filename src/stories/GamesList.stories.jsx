import React from 'react';
import GamesList from '../GamesList';

export default {
  title: 'GamesList',
  component: GamesList,
};

const Template = args => <GamesList {...args} />;

export const Visible = Template.bind({});
Visible.args = { game_sessions: [] };
