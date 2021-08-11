import React from 'react';
import GamesQuery from '../GamesQuery';
import Header from '../layout/Header';
import Login from '../Login';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';

const Home = () => {
  const cookies = new Cookies();

  return (
    <>
      <Header />
      <GamesQuery />
      <Login usernameExists={cookies.get('username') != null} />
    </>
  );
};

export default Home;
