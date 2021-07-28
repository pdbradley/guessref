import React from 'react';

import Game from '../Game';

export default {
  title: 'Example/Game',
  component: Game,
};

const Template = args => <Game {...args} />;

export const Primary = Template.bind({});
Primary.args = {};

export const Secondary = Template.bind({});
Secondary.args = {};

export const Large = Template.bind({});
Large.args = {};

export const Small = Template.bind({});
Small.args = {};
