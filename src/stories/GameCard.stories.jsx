import React from 'react';
import GameCard from '../GameCard';

export default {
  title: 'GameCard',
  component: GameCard,
};

const Template = args => <GameCard {...args} />;

export const Visible = Template.bind({});
Visible.args = {wordText: 'Joshua', visible: true};

