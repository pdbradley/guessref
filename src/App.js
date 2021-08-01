import Games from './Games';
import VerseWord from './VerseWord';
import {
  ApolloClient,
  ApolloProvider,
  InMemoryCache,
  HttpLink,
} from '@apollo/client';
import {WebSocketLink} from '@apollo/client/link/ws';

const createApolloClient = () => {
  return new ApolloClient({
    //link: new HttpLink({
    //uri: 'http://localhost:8080/v1/graphql',
    link: new WebSocketLink({
      uri: 'ws://localhost:8080/v1/graphql',
    }),
    cache: new InMemoryCache(),
  });
};

function App() {
  const client = createApolloClient();
  return (
    <ApolloProvider client={client}>
      <Games />
    </ApolloProvider>
  );
}

export default App;
