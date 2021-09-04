import React from 'react';
import 'bulma/css/bulma.min.css';
import { Tag } from 'react-bulma-components';

const VerseWord = ({ wordText, visible = true }) => {
  const word_length_plus_two = wordText.length + 2;
  const blankWord = new Array(word_length_plus_two).join('_');
  return (
    <Tag size="large" style={{ width: `${word_length_plus_two * 0.7}rem` }}>
      {visible ? wordText : blankWord}
    </Tag>
  );
};

export default VerseWord;
