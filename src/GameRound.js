import React from 'react';
import 'bulma/css/bulma.min.css';
import {Container, Heading} from 'react-bulma-components';
import Verse from './Verse';

const GameRound = ({gameRound}) => {
  console.log('GameRound:', gameRound);
  if (!gameRound) {
    return <div>No Game Round</div>;
  }
  return <Verse verse={gameRound.verses[0]} />;
};

export default GameRound;
