import React from 'react';
import 'bulma/css/bulma.min.css';
import {Section} from 'react-bulma-components';
import GameRound from './GameRound';
import LeaveGameButton from './LeaveGameButton';
import StartGameButton from './StartGameButton';
import Chats from './Chats';
import ChatInput from './ChatInput';

const GameSession = ({game_session}) => {
  if (!game_session) {
    return <div>No Session</div>;
  }
  let ACTIVE = game_session.status === "ACTIVE";

  return (
    <>
      <Section textAlign="center">
        {ACTIVE ? <GameRound gameRound={game_session.game_rounds[0]} /> : <StartGameButton />}
      </Section>
      <Section textAlign="center">
        <LeaveGameButton />
      </Section>
      <Section textAlign="center">
        <Chats chats={game_session.chat_messages} />
        <ChatInput />
      </Section>
    </>
  );
};

export default GameSession;
