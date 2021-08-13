import React from 'react';
import 'bulma/css/bulma.min.css';
import {Card} from 'react-bulma-components';

const ChatRow = ({id, author, content}) => {
  return (
    <Card>
      <Card.Content>
        {author}: {content}
      </Card.Content>
    </Card>
  );
};

export default ChatRow;
