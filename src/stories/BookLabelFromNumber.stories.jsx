import React from 'react';
import BookLabelFromNumber from '../BookLabelFromNumber';

export default {
  title: 'BookLabelFromNumber',
  component: BookLabelFromNumber,
};

const Template = args => <BookLabelFromNumber {...args} />;

export const Genesis = Template.bind({});
Genesis.args = {book_number : 1};

export const Revelation = Template.bind({});
Revelation.args = {book_number : 66};