# Versey

This project is an experiment so I can learn React, play with graphql subscriptions and the Hasura graphql engine,
practice using Storybook to prototype front end components, and play with the Bulma CSS framework.

A lot to chew on! Also if this game works, it will be a nice way to learn the references of many Bible verses.

## Stack:

## Project Journal

7/31/21

Just thoughts on how to do this. Basically I want a game where verses fade in word by word and players guess the book, chapter and verse number as the verse fades in. Sort of like wheel of fortune except in realtime. So you are rewarded by being more familiar with the verses, and the realtime element adds some tension. Also, multiplayer would add a lot.

- realtime verse fade in
- three tier guessing interface (book / chapter / verse)
- Some kind of ticker to make the game go forward on the server (I have no idea how to do this)
- pull the verse content from LSM's recovery version api
- Some way to have different sets of verses for different games (like from gospels, from entire NT, etc)
- no Auth needed, just pick a username and go
- join games in progres? menu of available games? (getting way ahead of myself)

One thing development teaches you is that you need to start small, and when you think you have the simplest thing in mind
you are wrong you need to sharpen that machete and make some more cuts that hurt.

So today my goal is basically to get a component to render in react that has a subscription to the hasura graphql engine.
