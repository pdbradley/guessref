import React from 'react';
import BookChapterVerseAnswers from '../BookChapterVerseAnswers';

export default {
  title: 'BookChapterVerseAnswers',
  component: BookChapterVerseAnswers,
};

const Template = args => <BookChapterVerseAnswers {...args} />;

export const Genesis_8_16 = Template.bind({});
Genesis_8_16.args = {
  book_answers: [
    { correct: true, book_number: "1", point_value: 3 },
    { correct: false, book_number: "2", point_value: 0 },
    { correct: false, book_number: "3", point_value: 0 },
    { correct: false, book_number: "4", point_value: 0 }],
  chapter_answers: [
    { correct: false, label: "6", point_value: 0 },
    { correct: false, label: "4", point_value: 0 },
    { correct: true, label: "8", point_value: 3 },
    { correct: false, label: "2", point_value: 0 }],
  verse_answers: [
    { correct: true, label: "16", point_value: 3 },
    { correct: false, label: "14", point_value: 0 },
    { correct: false, label: "33", point_value: 0 },
    { correct: false, label: "25", point_value: 0 }]
};
