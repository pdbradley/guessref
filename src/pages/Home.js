import React from 'react';
import { useHistory } from "react-router-dom";
import GamesQuery from '../GamesQuery';
import Header from '../layout/Header';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';

const Home = () => {
  let history = useHistory();
  const cookies = new Cookies();
  const usernameExists = cookies.get('username') != null;

  if (!usernameExists) {
    history.push('/login');
  }

  return (
    <>
      <Header />
      <GamesQuery />
    </>
  );
};

export default Home;
