import React from 'react';

import Verse from '../Verse';

export default {
  title: 'Verse',
  component: Verse,
};

const Template = args => <Verse {...args} />;

export const FullyVisible = Template.bind({});
FullyVisible.args = {
  verse: {
    verse_words: [
      { word_text: 'For', visible: true },
      { word_text: 'God', visible: true },
      { word_text: 'so', visible: true },
      { word_text: 'loved', visible: true },
      { word_text: 'the', visible: true },
      { word_text: 'world', visible: true },
      { word_text: 'that', visible: true },
      { word_text: 'He', visible: true },
      { word_text: 'gave', visible: true },
      { word_text: 'His', visible: true },
      { word_text: 'only', visible: true },
      { word_text: 'begotten', visible: true },
      { word_text: 'Son,', visible: true },
      { word_text: 'that', visible: true },
      { word_text: 'everyone', visible: true },
      { word_text: 'who', visible: true },
      { word_text: 'believes', visible: true },
      { word_text: 'into', visible: true },
      { word_text: 'Him', visible: true },
      { word_text: 'would', visible: true },
      { word_text: 'not', visible: true },
      { word_text: 'perish,', visible: true },
      { word_text: 'but', visible: true },
      { word_text: 'would', visible: true },
      { word_text: 'have', visible: true },
      { word_text: 'eternal', visible: true },
      { word_text: 'life.', visible: true },
    ],
  },
};

export const FullyInvisible = Template.bind({});
FullyInvisible.args = {
  verse: {
    verse_words: [
      { word_text: 'For', visible: false },
      { word_text: 'God', visible: false },
      { word_text: 'so', visible: false },
      { word_text: 'loved', visible: false },
      { word_text: 'the', visible: false },
      { word_text: 'world', visible: false },
      { word_text: 'that', visible: false },
      { word_text: 'He', visible: false },
      { word_text: 'gave', visible: false },
      { word_text: 'His', visible: false },
      { word_text: 'only', visible: false },
      { word_text: 'begotten', visible: false },
      { word_text: 'Son,', visible: false },
      { word_text: 'that', visible: false },
      { word_text: 'everyone', visible: false },
      { word_text: 'who', visible: false },
      { word_text: 'believes', visible: false },
      { word_text: 'into', visible: false },
      { word_text: 'Him', visible: false },
      { word_text: 'would', visible: false },
      { word_text: 'not', visible: false },
      { word_text: 'perish,', visible: false },
      { word_text: 'but', visible: false },
      { word_text: 'would', visible: false },
      { word_text: 'have', visible: false },
      { word_text: 'eternal', visible: false },
      { word_text: 'life.', visible: false },
      { word_text: 'For', visible: false },
    ],
  },
};

export const PartiallyVisible = Template.bind({});
PartiallyVisible.args = {
  verse: {
    verse_words: [
      { word_text: 'For', visible: true },
      { word_text: 'God', visible: false },
      { word_text: 'so', visible: false },
      { word_text: 'loved', visible: false },
      { word_text: 'the', visible: true },
      { word_text: 'world', visible: true },
      { word_text: 'that', visible: false },
      { word_text: 'He', visible: true },
      { word_text: 'gave', visible: false },
      { word_text: 'His', visible: true },
      { word_text: 'only', visible: false },
      { word_text: 'begotten', visible: false },
      { word_text: 'Son,', visible: false },
      { word_text: 'that', visible: true },
      { word_text: 'everyone', visible: false },
      { word_text: 'who', visible: true },
      { word_text: 'believes', visible: false },
      { word_text: 'into', visible: false },
      { word_text: 'Him', visible: false },
      { word_text: 'would', visible: true },
      { word_text: 'not', visible: false },
      { word_text: 'perish,', visible: true },
      { word_text: 'but', visible: false },
      { word_text: 'would', visible: true },
      { word_text: 'have', visible: false },
      { word_text: 'eternal', visible: false },
      { word_text: 'life.', visible: false },
    ],
  },
};
