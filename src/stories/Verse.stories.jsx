import React from 'react';

import Verse from '../Verse';

export default {
  title: 'Verse',
  component: Verse,
};

const Template = args => <Verse {...args} />;

export const FullyVisible = Template.bind({});
FullyVisible.args = {
  verseWords: [
    {wordText: 'For', visible: true},
    {wordText: 'God', visible: true},
    {wordText: 'so', visible: true},
    {wordText: 'loved', visible: true},
    {wordText: 'the', visible: true},
    {wordText: 'world', visible: true},
    {wordText: 'that', visible: true},
    {wordText: 'He', visible: true},
    {wordText: 'gave', visible: true},
    {wordText: 'His', visible: true},
    {wordText: 'only', visible: true},
    {wordText: 'begotten', visible: true},
    {wordText: 'Son,', visible: true},
    {wordText: 'that', visible: true},
    {wordText: 'everyone', visible: true},
    {wordText: 'who', visible: true},
    {wordText: 'believes', visible: true},
    {wordText: 'into', visible: true},
    {wordText: 'Him', visible: true},
    {wordText: 'would', visible: true},
    {wordText: 'not', visible: true},
    {wordText: 'perish,', visible: true},
    {wordText: 'but', visible: true},
    {wordText: 'would', visible: true},
    {wordText: 'have', visible: true},
    {wordText: 'eternal', visible: true},
    {wordText: 'life.', visible: true},
  ],
};

export const FullyInvisible = Template.bind({});
FullyInvisible.args = {
  verseWords: [
    {wordText: 'For', visible: false},
    {wordText: 'God', visible: false},
    {wordText: 'so', visible: false},
    {wordText: 'loved', visible: false},
    {wordText: 'the', visible: false},
    {wordText: 'world', visible: false},
    {wordText: 'that', visible: false},
    {wordText: 'He', visible: false},
    {wordText: 'gave', visible: false},
    {wordText: 'His', visible: false},
    {wordText: 'only', visible: false},
    {wordText: 'begotten', visible: false},
    {wordText: 'Son,', visible: false},
    {wordText: 'that', visible: false},
    {wordText: 'everyone', visible: false},
    {wordText: 'who', visible: false},
    {wordText: 'believes', visible: false},
    {wordText: 'into', visible: false},
    {wordText: 'Him', visible: false},
    {wordText: 'would', visible: false},
    {wordText: 'not', visible: false},
    {wordText: 'perish,', visible: false},
    {wordText: 'but', visible: false},
    {wordText: 'would', visible: false},
    {wordText: 'have', visible: false},
    {wordText: 'eternal', visible: false},
    {wordText: 'life.', visible: false},
    {wordText: 'For', visible: false},
  ],
};

export const PartiallyVisible = Template.bind({});
PartiallyVisible.args = {
  verseWords: [
    {wordText: 'For', visible: true},
    {wordText: 'God', visible: false},
    {wordText: 'so', visible: false},
    {wordText: 'loved', visible: false},
    {wordText: 'the', visible: true},
    {wordText: 'world', visible: true},
    {wordText: 'that', visible: false},
    {wordText: 'He', visible: true},
    {wordText: 'gave', visible: false},
    {wordText: 'His', visible: true},
    {wordText: 'only', visible: false},
    {wordText: 'begotten', visible: false},
    {wordText: 'Son,', visible: false},
    {wordText: 'that', visible: true},
    {wordText: 'everyone', visible: false},
    {wordText: 'who', visible: true},
    {wordText: 'believes', visible: false},
    {wordText: 'into', visible: false},
    {wordText: 'Him', visible: false},
    {wordText: 'would', visible: true},
    {wordText: 'not', visible: false},
    {wordText: 'perish,', visible: true},
    {wordText: 'but', visible: false},
    {wordText: 'would', visible: true},
    {wordText: 'have', visible: false},
    {wordText: 'eternal', visible: false},
    {wordText: 'life.', visible: false},
  ],
};
