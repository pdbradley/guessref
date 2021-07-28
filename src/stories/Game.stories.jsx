import React from 'react';

import Game from '../Game';

export default {
  title: 'Game',
  component: Game,
};

const Template = args => <Game {...args} />;

export const Primary = Template.bind({});
Primary.args = {verse: 'wazzup'};

export const Secondary = Template.bind({});
Secondary.args = {};

export const Large = Template.bind({});
Large.args = {};

export const Small = Template.bind({});
Small.args = {};
