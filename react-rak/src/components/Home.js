import React, { Component } from 'react';
import { BrowserRouter as Router, Link, Route, Switch } from 'react-router-dom';

class Home extends React.Component {
  render() {
    return (
      <div>
        <ul>
          <li><Link to="/donor">Donor</Link></li>
          <li><Link to="/organization">Organization</Link></li>
        </ul>
      </div>
    );
  }
}

export default Home;