import React from 'react';
import VerseWord from '../VerseWord';

export default {
  title: 'VerseWord',
  component: VerseWord,
};

const Template = args => <VerseWord {...args} />;

export const Visible = Template.bind({});
Visible.args = {wordText: 'Joshua', visible: true};

export const Invisible = Template.bind({});
Invisible.args = {wordText: 'Joshua', visible: false};
