import React from 'react';
import CustomHero from './CustomHero';
import CustomNavbar from './CustomNavbar';
import 'bulma/css/bulma.min.css';

const Header = () => {
  return (
    <>
      <CustomHero />
      <CustomNavbar />
    </>
  );
};

export default Header;
