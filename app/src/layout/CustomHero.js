import React from 'react';
import 'bulma/css/bulma.min.css';
import {Hero, Container, Heading} from 'react-bulma-components';

const CustomHero = () => {
  return (
    <Hero size="small" color="info">
      <Hero.Header></Hero.Header>
      <Hero.Body>
        <Container>
          <Heading>Guessref</Heading>
          <Heading subtitle>How many words do you need to see?</Heading>
        </Container>
      </Hero.Body>
      <Hero.Footer></Hero.Footer>
    </Hero>
  );
};

export default CustomHero;
