import React from 'react';
import { Button } from 'react-bulma-components';
import Cookies from 'universal-cookie';
import { joinGameSession } from './FetchHelpers';

const JoinGameButton = ({ game_session_uuid }) => {
  const cookies = new Cookies();
  let user_uuid = cookies.get('user_uuid');

  function handleOnClick(e) {
    e.preventDefault();
    joinGameSession(game_session_uuid, user_uuid);
  }

  return (
    <Button color="link" onClick={handleOnClick}>
      Join Game
    </Button>
  );
};

export default JoinGameButton;
