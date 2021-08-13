import React from 'react';
import GamesQuery from '../GamesQuery';
import Header from '../layout/Header';
import Chats from '../Chats';
import ChatInput from '../ChatInput';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';

const ChatPage = () => {
  //const cookies = new Cookies();

  return (
    <>
      <Header />
      <Chats chats={[]} />
      <ChatInput />
    </>
  );
};

export default ChatPage;
