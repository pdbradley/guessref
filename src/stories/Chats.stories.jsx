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
    {id: 1, author: 'Robert', content: 'Howdy howdy!'},
    {id: 2, author: 'Bill', content: 'Hello from Phil'},
    {id: 3, author: 'Oleg', content: 'Hello from Oleg'},
    {id: 4, author: 'Andreas', content: 'Hello Andreas'},
  ],
};
