import Home from './pages/Home';
import NewGamePage from './pages/NewGamePage';
import Game from './Game';
import {ApolloClient, ApolloProvider, InMemoryCache} from '@apollo/client';
import {WebSocketLink} from '@apollo/client/link/ws';

import {BrowserRouter as Router, Switch, Route} from 'react-router-dom';

const createApolloClient = () => {
  return new ApolloClient({
    link: new WebSocketLink({
      uri: process.env.REACT_APP_HASURA_WEBSOCKET_URL,
    }),
    cache: new InMemoryCache(),
  });
};

function App() {
  const client = createApolloClient();
  return (
    <Router>
      <ApolloProvider client={client}>
        <Switch>
          <Route path="/game/:uuid">
            <Game />
          </Route>
          <Route path="/new_game">
            <NewGamePage />
          </Route>
          <Route path="/">
            <Home />
          </Route>
        </Switch>
      </ApolloProvider>
    </Router>
  );
}

export default App;
