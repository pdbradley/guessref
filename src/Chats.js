import React from 'react';
import 'bulma/css/bulma.min.css';

const Chats = ({chats}) => {
  return (
    <div className="content">
      {chats.map(({id, author, content}) => (
        <div key={id}>{id}</div>
      ))}
    </div>
  );
};

export default Chats;
