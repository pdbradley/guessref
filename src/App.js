import Home from './pages/Home';
import About from './pages/About';
import Game from './Game';
import { ApolloClient, ApolloProvider, InMemoryCache } from '@apollo/client';
import { WebSocketLink } from '@apollo/client/link/ws';

import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

const createApolloClient = () => {
  return new ApolloClient({
    //link: new HttpLink({
    //uri: 'http://localhost:8080/v1/graphql',
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
          <Route path="/about">
            <About />
          </Route>
          <Route path="/game/:uuid">
            <Game />
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
