import React from 'react';
import { Link } from 'react-router-dom';

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