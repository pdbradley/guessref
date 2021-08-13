import React from 'react';
import ChatRow from './ChatRow';
import 'bulma/css/bulma.min.css';

const Chats = ({chats}) => {
  return (
    <>
      {chats.map(chat => (
        <ChatRow key={chat.id} chat={chat} />
      ))}
    </>
  );
};

export default Chats;
