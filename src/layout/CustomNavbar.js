import React, {Fragment} from 'react';
import 'bulma/css/bulma.min.css';
import {Link} from 'react-router-dom';
import {
  Navbar,
  Hero,
  Section,
  Container,
  Heading,
} from 'react-bulma-components';

const CustomNavbar = () => {
  return (
    <Navbar>
      <Navbar.Item>
        <Link to="/home">Home</Link>
      </Navbar.Item>
      <Navbar.Item>
        <Link to="/games">Games</Link>
      </Navbar.Item>
      <Navbar.Item>
        <Link to="/about">About</Link>
      </Navbar.Item>
    </Navbar>
  );
};

export default CustomNavbar;
