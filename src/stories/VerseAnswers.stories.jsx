import React from 'react';
import VerseAnswers from '../VerseAnswers';

export default {
  title: 'VerseAnswers',
  component: VerseAnswers,
};

const Template = args => <VerseAnswers {...args} />;

export const Visible = Template.bind({});
Visible.args = {
  verse_answers: [{ correct: true, label: "1", point_value: 3 },
  { correct: false, label: "4", point_value: 0 },
  { correct: false, label: "3", point_value: 0 },
  { correct: false, label: "2", point_value: 0 }]
};
