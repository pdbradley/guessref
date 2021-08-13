import React from 'react';
import 'bulma/css/bulma.min.css';
import {Card} from 'react-bulma-components';

const ChatRow = ({chat}) => {
  return (
    <Card>
      <Card.Content>{chat.message}</Card.Content>
    </Card>
  );
};

export default ChatRow;
