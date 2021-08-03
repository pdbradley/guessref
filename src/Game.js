import React, {Fragment} from 'react';
import 'bulma/css/bulma.min.css';
//import {Section, Container, Heading} from 'react-bulma-components';
import {useSubscription, gql} from '@apollo/client';

const GET_GAME = gql`
  subscription getGame($uuid: uuid) {
    game_sessions(where: {uuid: {_eq: $uuid}}) {
      uuid
      game_rounds(where: {status: {_eq: "ACTIVE"}}) {
        id
        verses(where: {status: {_eq: "ACTIVE"}}) {
          id
          verse_words {
            id
            word_text
            visible
          }
        }
      }
    }
  }
`;

const Game = ({uuid}) => {
  const {loading, error, data} = useSubscription(GET_GAME);

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

  return <>{uuid}</>;
};

export default Game;
