import React from 'react';
import Header from '../layout/Header';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';
import {Box} from 'react-bulma-components';
import NewGame from '../NewGame';

const NewGamePage = () => {
  const cookies = new Cookies();
  const usernameExists = cookies.get('username') != null;

  if (!usernameExists) {
    window.location = '/login'
  }

  return (
    <>
      <Header />
      <Box>
        <NewGame />
      </Box>
    </>
  );
};

export default NewGamePage;
