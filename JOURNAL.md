## Project Journal

**7/31/21**

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

**8/1/21**

Spent way to much time wondering why wss:// for the socket api was not working. needs to be ws://!!

Because no SSL locally...

Laying the groundwork and plumbing:

- Got apollo subscriptions working (hasura backend)
- Need to get api endpoints from ENV vars
- Need to figure out how routing works in react...

I think I'll setup something in the api now, where you "start" a game, and the game goes for 10 ticks and ends.

That should be enough to start a game and just watch the ticker. and get a few rspec specs in place to verify
game correctness.

**8/2/21**

Put a few models into the api. GameSession, GameRound, Verse, VerseWord. No users yet. Trying to come
up with a way where you can send "ticks" to a game session and have it simply march forward. I'll probably
just use ActiveJob and have each tick schedule the next one a second later eventually.

So I put in a bunch of specs where it sort of goes round by round, verse by verse, revealing words, until the game is done.

Of course the game is just watching a few verses reveal themselves, not much fun yet. But as that is happening on a timer,
The api can handle the input from users (guessing references etc) and do scoring simultaneously. So my basic thought is that once you
start a game session, it just marches on until finished, and users can join, guess, etc, and those are just separate api calls
that happen alongside the ticking timer of the game.

**8/4/21**

Got a "ticking" game engine that runs through rounds and verses, revealing words one at a time until it ends.
Each tick schedules the next tick as it ends. Some halfway ok tests.

Also built some logic to add some very lame fake answers to verses. This will need to be pretty sharp but for now it's ok.

Struggling with, as always, front end stuff. Bulma, React. React router is nice, easy to understand.

Next step is to create an api endpoint to create a game session and also start it, then wire that into react somewhere.

**8/5/21**

Opened the door yesterday to JC and DH so they could learn a little storybook / react. Noticed that my model
for ticking through game state seems overcomplicated. Trying think of ways to simplify it.

**8/7/21**

Thinking out loud now:

GameSession, GameRound, and Verse should have states along the lines of queued, active, complete

```
GameSession.tick
  if active game round
    active_game_round.tick
  else
    mark game session complete
  end
end

GameRound.tick
  if active verse
    active_verse.tick
  else
    mark game round complete
    schedule game_session.tick
  end
end

Verse.tick
  if words_left
    next_word.reveal
    schedule next verse.tick
  else
    mark verse complete
    schedule game_round.tick
  end
end
```
