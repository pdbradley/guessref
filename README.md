# Guessref

Guessref has been dockerized, so getting it up and running in development is not supposed to be hard.

Assuming you have docker installed, you should be able to go into the root of the project
where the docker-compose.yml file is, and simply type

```docker-compose up```

This should build or pull, then run, the images you need (basically to run rails, postgres, and redis)

Note that locally, if you have ports 3000, 

I hope my docker terminology is correct.  








A lot to chew on! Also if this game works, it will be a nice way to learn the references of many Bible verses.

[Journal of progress](JOURNAL.md)

## Getting Started:

1. clone project
2. docker-compose up (should spin up four containers--postgres, rails, node, hasura)
3. go to localhost:3000
