import React from 'react';
import { useHistory } from "react-router-dom";
import Header from '../layout/Header';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';
import { Box } from 'react-bulma-components';
import NewGame from '../NewGame';

const NewGamePage = () => {
  let history = useHistory();
  const cookies = new Cookies();
  const usernameExists = cookies.get('username') != null;

  if (!usernameExists) {
    history.push('/login');
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
