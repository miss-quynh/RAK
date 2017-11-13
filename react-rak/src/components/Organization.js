import React from 'react';

class Organization extends React.Component {

  constructor() {
    super();
    this.state = {

    }
  }

  componentDidMount() {
    fetch('http://localhost:8181/organizations/1', {
      method: 'GET'
    })
    .then(response => response.json())
    .then(data => {
      this.setState({  })
    })
  }
}

export default Organization;