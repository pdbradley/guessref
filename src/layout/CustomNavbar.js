import React from 'react';
import 'bulma/css/bulma.min.css';
import {Navbar} from 'react-bulma-components';

const CustomNavbar = () => {
  return (
    <Navbar>
      <Navbar.Item href="/home">Games </Navbar.Item>
      <Navbar.Item href="/new_game">New Game </Navbar.Item>
    </Navbar>
  );
};

export default CustomNavbar;
