import React, {useState} from 'react';
import 'bulma/css/bulma.min.css';
import {Form, Field, Label, Control, Input} from 'react-bulma-components';

const ChatInput = () => {
  const [chatMessage, setChatMessage] = useState('');

  const handleChange = event => {
    setChatMessage(event.target.value);
  };

  const handleKey = event => {
    if (event.key === 'Enter') {
      console.log('send my chat', chatMessage);
      setChatMessage('');
    }
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
