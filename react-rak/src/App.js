import React, { Component } from 'react';
import logo from './logo.svg';

import { BrowserRouter as Router, Link, Route, Switch } from 'react-router-dom';

import './App.css';
import Home from './components/Home'
import User from './components/User'


class App extends React.Component {
  render() {
    return(
      <Router>
        <div>
          <header>
            <h1>RaK</h1>
            <Link to="/">Home</Link>{' '}
          </header>

          <Switch>
            <Route exact path="/" component={Home} />
            <Route exact path="/user" component={User} />
            <Route render={() => <h1>Page not found</h1>} />
          </Switch>
        </div>
      </Router>
    )
  }
}

export default App;
