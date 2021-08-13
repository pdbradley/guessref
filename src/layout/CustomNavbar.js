import React from 'react';
import 'bulma/css/bulma.min.css';
import {Navbar} from 'react-bulma-components';

const CustomNavbar = () => {
  return (
    <Navbar>
      <Navbar.Item href="/home">Home </Navbar.Item>
      <Navbar.Item href="/games">Games</Navbar.Item>
      <Navbar.Item href="/about">About</Navbar.Item>
      <Navbar.Item href="/chat">Chat</Navbar.Item>
    </Navbar>
  );
};

export default CustomNavbar;
