import React from 'react';
import 'bulma/css/bulma.min.css';
import {Card} from 'react-bulma-components';

const ChatRow = ({chat}) => {
  return (
    <Card>
      <span className="has-text-info">{chat.user.name}: </span>
      <span>{chat.message}</span>
    </Card>
  );
};

export default ChatRow;
