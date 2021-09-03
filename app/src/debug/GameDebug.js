import React from 'react';
import 'bulma/css/bulma.min.css';
import {Container, Heading, Section} from 'react-bulma-components';

const GameDebug = ({game_session}) => {
  //want to use this component to show certain game session info for debugging
  //yes i know you can use react tools for stuff like this

  if (!game_session) {
    return <div>No Game</div>;
  }

  return (
    <Section>
      <div>{game_session.uuid}</div>
    </Section>
  );
};

export default GameDebug;
