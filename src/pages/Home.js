import React from 'react';
import GamesQuery from '../GamesQuery';
import Header from '../layout/Header';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';

const Home = () => {
  const cookies = new Cookies();
  const usernameExists = cookies.get('username') != null;

  if (!usernameExists) {
    window.location = '/login'
  }
  
  return (
    <>
      <Header />
      <GamesQuery />
    </>
  );
};

export default Home;
