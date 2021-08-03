import React from 'react';
import 'bulma/css/bulma.min.css';
// import {Section, Container, Heading} from 'react-bulma-components';
import {useSubscription, gql} from '@apollo/client';
import Game from './Game';

const GET_GAMES = gql`
  subscription getGames {
    game_sessions {
      uuid
    }
  }
`;

const Games = () => {
  const {loading, error, data} = useSubscription(GET_GAMES);

  if (loading) {
    console.log('hi');
    return <div>Loading...</div>;
  }
  if (error) {
    console.error(error);
    return <div>Error!</div>;
  }

  console.log(data);
  console.log('GS:');
  console.log(data.game_sessions);
  //return <div>{data.game_sessions.length}</div>;
  return (
    <div>
      {data.game_sessions.map(e => (
        <Game uuid={e.uuid} />
      ))}
    </div>
  );
};

export default Games;
