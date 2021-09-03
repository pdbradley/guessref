import React from 'react';
import { Button } from 'react-bulma-components';

const StartGameButton = () => {
    let game_session_uuid = window.location.pathname.split('/')[2];

    function handleOnClick(e) {
        e.preventDefault();
        fetch(`${process.env.REACT_APP_RAILS}/start_game`, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                uuid: game_session_uuid
            })
        }).then(response => {
            console.log(response);
        }
        ).catch(error => {
            console.log(error)
        })
    }

    return (
        <Button color="link" onClick={handleOnClick}>Start Game</Button>
    );
};
export default StartGameButton;