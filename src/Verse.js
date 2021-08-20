import React from 'react';
import 'bulma/css/bulma.min.css';
import VerseWord from './VerseWord';
import VerseAnswer from './VerseAnswer';

const Verse = ({ verse }) => {
  if (!verse) {
    return <div>Waiting on Verse</div>;
  }
  if (verse.status === 'REVEALED') {
    let book_answer = verse.book_answers[verse.book_answers.map(ba => ba.correct).indexOf(true)].label;
    let chapter_answer = verse.chapter_answers[verse.chapter_answers.map(ba => ba.correct).indexOf(true)].label;
    let verse_answer = verse.verse_answers[verse.verse_answers.map(ba => ba.correct).indexOf(true)].label;
    return <VerseAnswer book={book_answer} chapter={chapter_answer} verse={verse_answer} />;
  }
  return (
    <div className="content">
      {verse.verse_words.map(({ id, word_text, visible }) => (
        <VerseWord key={id} wordText={word_text} visible={visible} />
      ))}
    </div>
  );
};

export default Verse;
