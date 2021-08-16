import React from 'react';
import 'bulma/css/bulma.min.css';
import { useSubscription, gql } from '@apollo/client';
import GamesList from './GamesList';

const GET_GAMES = gql`
  subscription getGames {
    game_sessions(order_by: {status: asc, created_at: desc}, where: {_not: {status: {_eq: "COMPLETED"}}}) {
      id
      status
      uuid
      name
      participants_aggregate {
        aggregate {
          count
        }
      }
      game_rounds_aggregate {
        aggregate {
          count
        }
      }
      game_rounds {
        verses_aggregate {
          aggregate {
            count
          }
        }
      }
    }
  }
`;

const GamesQuery = () => {
  const { loading, error, data } = useSubscription(GET_GAMES);

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
