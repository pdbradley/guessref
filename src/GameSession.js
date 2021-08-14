import React from 'react';
import 'bulma/css/bulma.min.css';
import { Columns, Section } from 'react-bulma-components';
import GameRound from './GameRound';
import LeaveGameButton from './LeaveGameButton';
import GameSessionScores from './GameSessionScores';
import StartGameButton from './StartGameButton';
import Chats from './Chats';
import ChatInput from './ChatInput';
import Cookies from 'universal-cookie';

const GameSession = ({ game_session }) => {
  if (!game_session) {
    return <div>No Session</div>;
  }
  const cookies = new Cookies();
  const user_uuid = cookies.get('user_uuid');

  let CREATOR = user_uuid === game_session.creator_uuid
  let ACTIVE = game_session.status === 'ACTIVE';
  console.log(CREATOR)


  return (
    <>
      <Columns>
        <Columns.Column size="one-fifth">
          <GameSessionScores
            game_session_scores={game_session.game_session_scores}
          />
        </Columns.Column>
        <Columns.Column>
          <Section textAlign="center">
            {!ACTIVE && CREATOR && <StartGameButton />}
            {!ACTIVE && !CREATOR && "Wait for Creator to Start Game"}
            {ACTIVE && <GameRound gameRound={game_session.game_rounds[0]} />}
          </Section>
          <Section textAlign="center">
            <LeaveGameButton />
          </Section>
        </Columns.Column>
        <Columns.Column size="one-fifth">
          <Chats chats={game_session.chat_messages} />
          <ChatInput />
        </Columns.Column>
      </Columns>
    </>
  );
};

export default GameSession;
