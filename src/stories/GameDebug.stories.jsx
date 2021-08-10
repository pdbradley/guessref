import React from 'react';
import GameDebug from '../debug/GameDebug';

export default {
  title: 'GameDebug',
  component: GameDebug,
};

const Template = args => <GameDebug {...args} />;

export const Visible = Template.bind({});

Visible.args = {game_session: {uuid: 'nargh'}};
