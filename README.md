# Guessref

This project is an experiment so I can learn React, play with graphql subscriptions and the Hasura graphql engine,
practice using Storybook to prototype front end components, and play with the Bulma CSS framework.

A lot to chew on! Also if this game works, it will be a nice way to learn the references of many Bible verses.

[Journal of progress](JOURNAL.md)

## Getting Started:

1. clone project
2. docker-compose up
3. cd api
4. bundle install
5. bin/rails db:create
6. bin/rails db:migrate
7. cd ../hasura
8. hasura metadata apply --admin-secret SECRET (whatever is in docker-compose.yml)
