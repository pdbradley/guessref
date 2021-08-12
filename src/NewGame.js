import React, { useState } from 'react';
import 'bulma/css/bulma.min.css';
import { Form, Button } from 'react-bulma-components';
import Cookies from 'universal-cookie';

const NewGame = () => {
    const cookies = new Cookies();
    let user_uuid = cookies.get('user_uuid');
    const [gameName, setGameName] = useState('');

    function handleOnClick(e) {
        e.preventDefault();
        if (gameName.length >= 2) {
            fetch(`${process.env.REACT_APP_RAILS}/games`, {
                method: 'POST',
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    name: gameName,
                    creator_uuid: user_uuid
                })
            }).then(response =>
                response.json()
            ).then(data => {
                console.log(data);
            }
            ).catch(error => {
                console.log(error)
            })
            setGameName('');
        }
    }

    return (
        <form>
            <Form.Field>
                <Form.Label>Game name</Form.Label>
                <Form.Label size={"small"}>Must be at least 2 characters.</Form.Label>
                <Form.Control>
                    <Form.Input
                        color="success"
                        placeholder={'Enter a game name'}
                        value={gameName}
                        onChange={(e) => {
                            return setGameName(e.target.value);
                        }}
                    />
                </Form.Control>

                <Form.Field>
                    <Form.Control>
                        <Button color="link"
                            onClick={handleOnClick}>Create Game</Button>
                    </Form.Control>
                </Form.Field>
            </Form.Field>
        </form>
    );
};

export default NewGame;