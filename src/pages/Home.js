import React, {Fragment} from 'react';
import GamesQuery from '../GamesQuery';
import Header from '../layout/Header';
import 'bulma/css/bulma.min.css';
import {Link} from 'react-router-dom';
import {
  Navbar,
  Hero,
  Section,
  Container,
  Heading,
} from 'react-bulma-components';

const Home = () => {
  return (
    <>
      <Header />
      <GamesQuery />
    </>
  );
};

export default Home;
