import React from 'react';

import ChatInput from '../ChatInput';

export default {
  title: 'Chat Input',
  component: ChatInput,
};

const Template = args => <ChatInput {...args} />;

export const Default = Template.bind({});
Default.args = {};
