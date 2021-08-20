import React, { Fragment } from 'react';
import 'bulma/css/bulma.min.css';
import { useSubscription, gql } from '@apollo/client';
import { useHistory } from "react-router-dom";
import GameSession from './GameSession';
import CustomNavbar from './layout/CustomNavbar';
import CustomHero from './layout/CustomHero';
import { useParams } from 'react-router-dom';
import Cookies from 'universal-cookie';

const GET_GAME = gql`
  subscription getGame($uuid: uuid) {
    game_sessions(where: {uuid: {_eq: $uuid}}) {
      id
      uuid
      creator_uuid
      name
      status
      chat_messages(order_by: {created_at: asc}) {
        id
        message
        user {
          name
        }
      }
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
          verse_words(order_by: {id: asc}) {
            id
            word_text
            visible
          }
        }
      }
      game_session_scores(order_by: {score: desc}) {
        user_uuid
        score
        user {
          name
        }
      }
    }
  }
`;

const Game = () => {
  let history = useHistory();
  const cookies = new Cookies();
  const usernameExists = cookies.get('username') != null;

  const { uuid } = useParams();
  const { loading, error, data } = useSubscription(GET_GAME, {
    variables: { uuid: uuid },
  });

  if (!usernameExists) {
    history.push('/login');
    return (<></>);
  }

  if (loading) {
    console.log('hi');
    return <div>Loading...</div>;
  }
  if (error) {
    console.error(error);
    return <div>Error!</div>;
  }

  return (
      <GameSession game_session={data.game_sessions[0]} />
  );
};

export default Game;
