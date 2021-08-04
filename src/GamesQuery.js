import React from 'react';
import 'bulma/css/bulma.min.css';
// import {Section, Container, Heading} from 'react-bulma-components';
import {useSubscription, gql} from '@apollo/client';
import Game from './Game';
import GamesList from './GamesList';

const GET_GAMES = gql`
  subscription getGames {
    game_sessions {
      id
      uuid
    }
  }
`;

const GamesQuery = () => {
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
  return (
    <div>
      <GamesList game_sessions={data.game_sessions} />
    </div>
  );
};

export default GamesQuery;
