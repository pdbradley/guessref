import React from 'react';
import 'bulma/css/bulma.min.css';
import {Tag} from 'react-bulma-components';

const VerseWord = ({wordText, visible}) => {
  const blankWord = new Array(wordText.length + 2).join('_');
  //return <span class="tag">{visible ? wordText : blankWord}</span>;
  return (
    <Tag size="large" color="text">
      {visible ? wordText : blankWord}
    </Tag>
  );
};

export default VerseWord;
