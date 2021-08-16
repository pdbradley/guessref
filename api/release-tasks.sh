export NODE_OPTIONS=
bundle exec rake db:migrate &&
npm install --global hasura-cli@2.0.0-alpha.10 &&
cd hasura &&
hasura metadata apply --admin-secret $HASURA_ADMIN_SECRET --endpoint $HASURA_ENDPOINT
