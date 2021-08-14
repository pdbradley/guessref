import React, { useState } from 'react';
import { Box, Form, Button } from 'react-bulma-components';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';

const LoginPage = () => {
    const [username, setUsername] = useState('');
    const cookies = new Cookies();

    function handleOnSubmit(e) {
        e.preventDefault();
        if (username.length >= 2) {
            fetch(`${process.env.REACT_APP_HASURA_REST_API}/create_user`, {
                method: 'POST',
                body: JSON.stringify({
                    name: username,
                })
            }).then(response =>
                response.json()
            ).then(data => {
                cookies.set('user_uuid', data.insert_users_one.uuid, { path: '/' });
                cookies.set('username', username, { path: '/' });
                window.location = '/';
            }
            ).catch(error => {
                console.log(error)
            })
        }
    }

    return (
        <Box style={{ width: 400, margin: 'auto' }}>
            <form>
                <Form.Field>
                    <Form.Label>Username</Form.Label>
                    <Form.Label size={"small"}>Must be at least 2 characters.</Form.Label>
                    <Form.Control>
                        <Form.Input
                            color="success"
                            placeholder={'What\'s your name?'}
                            value={username}
                            onChange={(e) => {
                                return setUsername(e.target.value);
                            }}
                        />
                    </Form.Control>
                </Form.Field>

                <Form.Field>
                    <Form.Control>
                        <Button color="link"
                            onClick={handleOnSubmit}>Let's Go!</Button>
                    </Form.Control>
                </Form.Field>
            </form>
        </Box>
    );
};

export default LoginPage;