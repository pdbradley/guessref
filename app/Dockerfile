FROM node:slim

RUN mkdir /app
WORKDIR /app

ENV NODE_ENV=development \
  PATH=/app/node_modules/.bin:$PATH

COPY *.json .
RUN yarn install

COPY public public/
COPY src src/

EXPOSE 3000

ENTRYPOINT yarn start
