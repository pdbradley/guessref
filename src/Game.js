import React, {Fragment} from 'react';
import 'bulma/css/bulma.min.css';
import {useSubscription, gql} from '@apollo/client';
import GameSession from './GameSession';
import CustomNavbar from './layout/CustomNavbar';
import CustomHero from './layout/CustomHero';
import {useParams} from 'react-router-dom';

const GET_GAME = gql`
  subscription getGame($uuid: uuid) {
    game_sessions(where: {uuid: {_eq: $uuid}}) {
      uuid
      game_rounds(where: {status: {_eq: "ACTIVE"}}) {
        id
        verses(where: {status: {_in: ["ACTIVE", "REVEALED"]}}) {
          id
          book_answers {
            point_value
            correct
            label
          }
          chapter_answers {
            point_value
            correct
            label
          }
          verse_answers {
            point_value
            correct
            label
          }
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

const Game = () => {
  const {uuid} = useParams();
  const {loading, error, data} = useSubscription(GET_GAME, {
    variables: {uuid: uuid},
  });

  if (loading) {
    console.log('hi');
    return <div>Loading...</div>;
  }
  if (error) {
    console.error(error);
    return <div>Error!</div>;
  }

  return (
    <>
      <CustomHero />
      <CustomNavbar />
      <GameSession game_session={data.game_sessions[0]} />
    </>
  );
};

export default Game;
