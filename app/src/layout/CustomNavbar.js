import React from 'react';
import { useHistory } from "react-router-dom";
import 'bulma/css/bulma.min.css';
import { Navbar } from 'react-bulma-components';
import Cookies from 'universal-cookie';

const CustomNavbar = () => {
  let history = useHistory();
  const cookies = new Cookies();

  const usernameExists = cookies.get('username') != null;

  function handleOnClick(e) {
    cookies.remove('username', { path: '/' });
    cookies.remove('user_uuid', { path: '/' });
    cookies.remove('game_session_uuid', { path: '/' });
    history.push('/login');
  }

  return (
    <Navbar>
      <Navbar.Container align="left">
        <Navbar.Item href="/home">Games </Navbar.Item>
        <Navbar.Item href="/new_game">New Game </Navbar.Item>
      </Navbar.Container>

      {usernameExists ? <Navbar.Container align="right">
        <Navbar.Item textColor="info" renderAs="div">
          Hi, {cookies.get('username')}
        </Navbar.Item>
        <Navbar.Item onClick={handleOnClick}>
          Log Out
        </Navbar.Item>
      </Navbar.Container> : <></>}
    </Navbar>
  );
};

export default CustomNavbar;
