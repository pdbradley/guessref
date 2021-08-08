import React, { useState } from 'react';
import { Box, Form, Button } from 'react-bulma-components';
import Cookies from 'universal-cookie';

const Login = ({ usernameExists }) => {
    const [username, setUsername] = useState('');
    const cookies = new Cookies();
    const showHideLogin = usernameExists ? "hidden" : "block";

    return (
        <Box display={showHideLogin} style={{ width: 400, margin: 'auto' }}>
            <form>
                <Form.Field>
                    <Form.Label>Username</Form.Label>
                    <Form.Control>
                        <Form.Input
                            color="success"
                            placeholder={'Enter a username'}
                            value={username}
                            onChange={(e) => {
                                return setUsername(e.target.value);
                            }}
                        />
                    </Form.Control>
                    <Form.Help color="success">This username is available</Form.Help>
                </Form.Field>

                <Form.Field>
                    <Form.Control>
                        <Button color="link"
                            onClick={() => {
                                if (username != '') {
                                    cookies.set('username', username, { path: '/' });
                                }
                            }}> Submit</Button>
                    </Form.Control>
                </Form.Field>
            </form>
        </Box>
    );
};

export default Login;