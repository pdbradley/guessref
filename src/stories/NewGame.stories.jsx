import React from 'react';
import NewGame from '../NewGame';

export default {
  title: 'NewGame',
  component: NewGame,
};

const Template = args => <NewGame {...args} />;

export const BlankForm = Template.bind({});
BlankForm.args = {};
