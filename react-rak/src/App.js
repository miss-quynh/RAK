import React from 'react';

import { BrowserRouter as Router, Link, Route, Switch } from 'react-router-dom';

import './App.css';
import Home from './components/Home'
import Donor from './components/Donor'
import Organization from './components/Organization'


class App extends React.Component {
  render() {
    return(
      <Router>
        <div>
          <header>

            <Link to="/"><h1>RaK</h1></Link>{' '}
          </header>

          <Switch>
            <Route exact path="/" component={Home} />
            <Route exact path="/donor" component={Donor} />
            <Route path="/organizations/:id" component={Organization} />
            <Route render={() => <h1>Page not found</h1>} />
          </Switch>
        </div>
      </Router>
    )
  }
}

export default App;
