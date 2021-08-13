import React from 'react';
import 'bulma/css/bulma.min.css';
import Verse from './Verse';

const GameRound = ({gameRound}) => {
  if (!gameRound) {
    return <div>No Game Round</div>;
  }
  return <Verse verse={gameRound.verses[0]} />;
};

export default GameRound;
