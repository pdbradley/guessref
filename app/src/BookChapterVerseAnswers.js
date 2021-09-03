import React, { useState } from 'react';
import 'bulma/css/bulma.min.css';
import Cookies from 'universal-cookie';
import BookAnswers from './BookAnswers';
import VerseAnswers from './VerseAnswers';

const BookChapterVerseAnswers = ({ verse }) => {
  const cookies = new Cookies();
  const user_uuid = cookies.get('user_uuid');
  const game_session_uuid = cookies.get('game_session_uuid');
  const [answers, setAnswers] = useState(cookies.get('answers'));

  // const answers = cookies.get('answers');
  if (!verse) {
    return <></>;
  }

  let showAnyThing = true;
  let showBookAnswers = false;
  let showChapterAnswers = false;
  let showVerseAnswers = false;
  switch (answers) {
    case "ANSWER_DONE":
      showAnyThing = false;
      break;
    case "NONE":
    default:
      showBookAnswers = true;
      break;
    case "BOOK_DONE":
      showChapterAnswers = true;
      break;
    case "CHAPTER_DONE":
      showVerseAnswers = true;
      break;
  }


  function getBookPoints() {
    let correct = verse.book_answers.filter(
      (answer) => answer.correct === true
    )
    return correct[0].point_value;
  }

  function getChapterPoints() {
    let correct = verse.chapter_answers.filter(
      (answer) => answer.correct === true
    )
    return correct[0].point_value;
  }

  function getVersePoints() {
    let correct = verse.verse_answers.filter(
      (answer) => answer.correct === true
    )
    return correct[0].point_value;
  }

  function handleBookAnswerClick(clickedAnswer) {
    if (clickedAnswer.correct) {
      sendScore(getBookPoints());
      cookies.set('answers', 'BOOK_DONE', { path: '/' });
    } else {
      cookies.set('answers', 'ANSWER_DONE', { path: '/' });
    }
    setAnswers((cookies.get('answers')));
  }

  function handleChapterAnswerClick(clickedAnswer) {
    if (clickedAnswer.correct) {
      sendScore(getChapterPoints());
      cookies.set('answers', 'CHAPTER_DONE', { path: '/' });
    } else {
      cookies.set('answers', 'ANSWER_DONE', { path: '/' });
    }
    setAnswers((cookies.get('answers')));
  }

  function handleVerseAnswerClick(clickedAnswer) {
    cookies.set('answers', 'ANSWER_DONE', { path: '/' });
    if (clickedAnswer.correct) {
      sendScore(getVersePoints());
    }
    setAnswers((cookies.get('answers')));
  }

  function sendScore(score) {
    fetch(`${process.env.REACT_APP_HASURA_REST_API}/insert_game_session_score`, {
      method: 'POST',
      body: JSON.stringify({
        game_session_uuid: game_session_uuid,
        user_uuid: user_uuid,
        score: score
      })
    }).then(response =>
      response.json()
    ).then(data => {
      console.log(data);
    }).catch(error => {
      console.log(error);
    })
  }

  return (
    <>
      {showAnyThing && <>
        {showBookAnswers && <BookAnswers onAnswerClicked={handleBookAnswerClick} book_answers={verse.book_answers} />}
        {showChapterAnswers && <VerseAnswers onAnswerClicked={handleChapterAnswerClick} verse_answers={verse.chapter_answers} LABEL={"Chapter"} />}
        {showVerseAnswers && <VerseAnswers onAnswerClicked={handleVerseAnswerClick} verse_answers={verse.verse_answers} LABEL={"Verse"} />}
      </>}
    </>
  );
};

export default BookChapterVerseAnswers;