import React from 'react';
import 'bulma/css/bulma.min.css';
import { Hero, Container, Heading } from 'react-bulma-components';

const CustomHero = () => {
  return (
    <Hero size="small" color="info">
      <Hero.Header>header stuff might be here</Hero.Header>
      <Hero.Body>
        <Container>
          <Heading>Guessref</Heading>
          <Heading subtitle>Guessref</Heading>
        </Container>
      </Hero.Body>
      <Hero.Footer>Here some footer stuff might live</Hero.Footer>
    </Hero>
  );
};

export default CustomHero;
