import React from 'react';
import { Button } from 'react-bulma-components';
import Cookies from 'universal-cookie';

const JoinGameButton = ({ game_session_uuid }) => {
    const cookies = new Cookies();
    let user_uuid = cookies.get('user_uuid');

    function handleOnClick(e) {
        e.preventDefault();
        fetch(`${process.env.REACT_APP_HASURA_REST_API}/join_game_session`, {
            method: 'POST',
            body: JSON.stringify({
                game_session_uuid: game_session_uuid,
                user_uuid: user_uuid
            })
        }).then(response =>
            response.json()
        ).then(data => {
            console.log(data);
            window.location = `/game/${game_session_uuid}`;
        }
        ).catch(error => {
            console.log(error);
            if (error.error.includes("duplicate key")) {
                window.location = `/game/${game_session_uuid}`;
            }
        })
    }

    return (
        <Button color="link" onClick={handleOnClick}>Join Game</Button>
    );
};

export default JoinGameButton;