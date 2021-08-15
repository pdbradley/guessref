import Cookies from 'universal-cookie';
const cookies = new Cookies();

function initializeScore(game_session_uuid, user_uuid) {
    fetch(`${process.env.REACT_APP_HASURA_REST_API}/insert_game_session_score`, {
        method: 'POST',
        body: JSON.stringify({
            game_session_uuid: game_session_uuid,
            user_uuid: user_uuid,
            score: 0
        })
    })
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.log(error));
}

export function joinGameSession(game_session_uuid, user_uuid) {
    fetch(`${process.env.REACT_APP_HASURA_REST_API}/join_game_session`, {
        method: 'POST',
        body: JSON.stringify({
            game_session_uuid: game_session_uuid,
            user_uuid: user_uuid,
        }),
    })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            window.location = `/game/${game_session_uuid}`;
            cookies.set('game_session_uuid', game_session_uuid, { path: '/' });
            console.log("Working")
            initializeScore(game_session_uuid, user_uuid);
        })
        .catch(error => {
            console.log(error);
            if (error.error && error.error.includes('duplicate key')) {
                window.location = `/game/${game_session_uuid}`;
            }
        });
}

