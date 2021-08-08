import React from 'react';
import BookAnswers from '../BookAnswers';

export default {
  title: 'BookAnswers',
  component: BookAnswers,
};

const Template = args => <BookAnswers {...args} />;

export const Genesis_through_Numbers = Template.bind({});
Genesis_through_Numbers.args = {
  book_answers: [
    { correct: true, book_number: "1", point_value: 3 },
    { correct: false, book_number: "2", point_value: 3 },
    { correct: false, book_number: "3", point_value: 3 },
    { correct: false, book_number: "4", point_value: 3 }]
};
