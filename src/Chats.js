import React from 'react';
import ChatRow from './ChatRow';
import 'bulma/css/bulma.min.css';
import {
  Heading,
  Tile,
  Section,
  Box,
  Notification,
  Card,
} from 'react-bulma-components';

const Chats = ({chats}) => {
  return (
    <Section>
      {chats.map(chat => (
        <ChatRow key={chat.id} {...chat} />
      ))}
    </Section>
  );
};

export default Chats;
