import React, {useState} from 'react';
import 'bulma/css/bulma.min.css';
import {Form, Field, Label, Control, Input} from 'react-bulma-components';
import Cookies from 'universal-cookie';

const ChatInput = () => {
  const cookies = new Cookies();
  const [chatMessage, setChatMessage] = useState('');
  const user_uuid = cookies.get('user_uuid');
  const game_session_uuid = cookies.get('game_session_uuid');

  const handleChange = event => {
    setChatMessage(event.target.value);
  };

  const handleKey = event => {
    if (event.key === 'Enter') {
      postChat();
      setChatMessage('');
    }
  };

  const postChat = () => {
    console.log('send my chat', chatMessage);
    fetch(`${process.env.REACT_APP_HASURA_REST_API}/create_chat_message`, {
      method: 'POST',
      body: JSON.stringify({
        game_session_uuid: game_session_uuid,
        user_uuid: user_uuid,
        message: chatMessage,
      }),
    })
      .then(response => response.json())
      .then(data => {
        console.log(data);
      })
      .catch(error => {
        console.log(error);
      });
  };

  return (
    <>
      <Form.Field>
        <Form.Control>
          <Form.Input
            value={chatMessage}
            onChange={handleChange}
            onKeyDown={handleKey}
          />
        </Form.Control>
      </Form.Field>
    </>
  );
};

export default ChatInput;
