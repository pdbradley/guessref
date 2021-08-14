import React from 'react';
import Header from '../layout/Header';
import Login from '../Login';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';
import {Box} from 'react-bulma-components';
import NewGame from '../NewGame';

const NewGamePage = () => {
  const cookies = new Cookies();

  return (
    <>
      <Header />
      <Login usernameExists={cookies.get('username') != null} />
      <Box>
        <NewGame />
      </Box>
    </>
  );
};

export default NewGamePage;