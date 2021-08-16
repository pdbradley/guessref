import React from 'react';
import 'bulma/css/bulma.min.css';
import { useSubscription, gql } from '@apollo/client';
import GamesList from './GamesList';

const GET_GAMES = gql`
  subscription getGames($sixHoursAgo: timestamp = "2021-08-15T18:13:07.084Z") {
    game_sessions(order_by: {status: asc}, where: {_not: {status: {_eq: "COMPLETED"}}, created_at: {_gte: $sixHoursAgo}}) {
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

function getTimestampSixHoursAgo() {
  const six_hours = 6 * 60 * 60 * 1000;
  const sixHoursAgo = new Date(Date.now() - six_hours);
  sixHoursAgo.setMinutes(0);
  sixHoursAgo.setSeconds(0);
  sixHoursAgo.setMilliseconds(0);
  return sixHoursAgo.toISOString();
}

const GamesQuery = () => {
  const sixHoursAgo = getTimestampSixHoursAgo();
  const { loading, error, data } = useSubscription(GET_GAMES, { variables: { sixHoursAgo } });

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
