import React, { useState } from 'react';
import 'bulma/css/bulma.min.css';
import Cookies from 'universal-cookie';
import BookAnswers from './BookAnswers';
import VerseAnswers from './VerseAnswers';

const BookChapterVerseAnswers = ({ verse }) => {
  const [showAnyThing, setShowAnyThing] = useState(true);
  const [showBookAnswers, setShowBookAnswers] = useState(true);
  const [showChapterAnswers, setShowChapterAnswers] = useState(false);
  const [showVerseAnswers, setShowVerseAnswers] = useState(false);

  if (!verse) {
    return <></>;
  }

  const cookies = new Cookies();
  const user_uuid = cookies.get('user_uuid');
  const game_session_uuid = cookies.get('game_session_uuid');

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
      setShowBookAnswers(false);
      setShowChapterAnswers(true);
    } else {
      setShowAnyThing(false);
    }
  }

  function handleChapterAnswerClick(clickedAnswer) {
    if (clickedAnswer.correct) {
      setShowChapterAnswers(false);
      setShowVerseAnswers(true);
    } else {
      endGuessingAndSendScore(getBookPoints());
    }
  }

  function handleVerseAnswerClick(clickedAnswer) {
    if (clickedAnswer.correct) {
      endGuessingAndSendScore(getBookPoints() + getChapterPoints() + getVersePoints());
    } else {
      endGuessingAndSendScore(getBookPoints() + getChapterPoints());
    }
  }

  function endGuessingAndSendScore(final_score) {
    console.log("final_score:", final_score)
    setShowAnyThing(false);
    fetch(`${process.env.REACT_APP_HASURA_REST_API}/insert_game_session_score`, {
      method: 'POST',
      body: JSON.stringify({
        game_session_uuid: game_session_uuid,
        user_uuid: user_uuid,
        score: final_score
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