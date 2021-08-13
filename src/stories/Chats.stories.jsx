import React from 'react';

import Chats from '../Chats';

export default {
  title: 'Chats',
  component: Chats,
};

const Template = args => <Chats {...args} />;

export const Default = Template.bind({});
Default.args = {
  chats: [
    {id: 1, author: 'Robert', message: 'Howdy howdy!'},
    {id: 2, author: 'Bill', message: 'Hello from Phil'},
    {id: 3, author: 'Oleg', message: 'Hello from Oleg'},
    {id: 4, author: 'Andreas', message: 'Hello Andreas'},
  ],
};
