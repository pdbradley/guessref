import React from 'react';
import 'bulma/css/bulma.min.css';
import {Tag} from 'react-bulma-components';

const VerseWord = ({wordText, visible = true}) => {
  return (
    <span className="mr-1" style={{visibility: visible ? 'visible' : 'hidden'}}>
      {wordText}
    </span>
  );
};

export default VerseWord;
