import React, {Fragment} from 'react';
import CustomHero from './CustomHero';
import CustomNavbar from './CustomNavbar';
import 'bulma/css/bulma.min.css';
import {Link} from 'react-router-dom';

const Header = () => {
  return (
    <>
      <CustomHero />
      <CustomNavbar />
    </>
  );
};

export default Header;
