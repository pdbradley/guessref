import React from 'react';
import Home from '../pages/Home';

export default {
  title: 'Pages/Home',
  component: Home,
  parameters: {
    layout: 'fullscreen',
  },
};

const Template = args => <Home {...args} />;

export const Visible = Template.bind({});
Visible.args = {};
