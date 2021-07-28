import React from 'react';
import 'bulma/css/bulma.min.css';
import {Section, Container, Heading} from 'react-bulma-components';
import Verse from './Verse';

const Game = ({verse, players}) => {
  return (
    <>
      <Section>
        <Verse verse={verse}></Verse>
        <Container>
          <div class="content">
            <p>
              For God so _____ the world that He ________ His only begotten Son,
              that whosoever believes in Him should not perish but should have
              eternal life.
            </p>
          </div>
        </Container>
      </Section>
    </>
  );
};

export default Game;
