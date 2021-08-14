import React from 'react';
import 'bulma/css/bulma.min.css';
import { Heading, Tile, Notification } from 'react-bulma-components';

const VerseAnswers = ({ onAnswerClicked, verse_answers }) => {
  function handleClick(answer) {
    onAnswerClicked(verse_answers[answer])
  }

  return (
    <Tile>
      <Tile kind="parent" vertical>
        <Tile style={{ padding: "5px 0px" }} kind="child" onClick={() => handleClick(0)} renderAs={Notification} color="success" textAlign="center">
          <Heading>{verse_answers[0].label}</Heading>
        </Tile>
        <Tile style={{ padding: "5px 0px" }} kind="child" onClick={() => handleClick(1)} renderAs={Notification} color="success" textAlign="center">
          <Heading>{verse_answers[1].label}</Heading>
        </Tile>
      </Tile>
      <Tile kind="parent" vertical>
        <Tile style={{ padding: "5px 0px" }} kind="child" onClick={() => handleClick(2)} renderAs={Notification} color="success" textAlign="center">
          <Heading>{verse_answers[2].label}</Heading>
        </Tile>
        <Tile style={{ padding: "5px 0px" }} kind="child" onClick={() => handleClick(3)} renderAs={Notification} color="success" textAlign="center">
          <Heading>{verse_answers[3].label}</Heading>
        </Tile>
      </Tile>
    </Tile>
  );
};

export default VerseAnswers;