import React, {Fragment} from 'react';
import GamesQuery from '../GamesQuery';
import CustomNavbar from '../layout/CustomNavbar';
import CustomHero from '../layout/CustomHero';
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
      <CustomHero />
      <CustomNavbar />
      <GamesQuery />
    </>
  );
};

export default Home;
