import React, { Fragment } from 'react';
import GamesQuery from '../GamesQuery';
import Header from '../layout/Header';
import Login from '../Login';
import Cookies from 'universal-cookie';
import 'bulma/css/bulma.min.css';
import { Link } from 'react-router-dom';
import {
  Navbar,
  Hero,
  Section,
  Container,
  Heading,
} from 'react-bulma-components';

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
