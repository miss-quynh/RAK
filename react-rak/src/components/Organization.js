import React from 'react';
import { BrowserRouter as Router, Link, Route, Switch } from 'react-router-dom';
import Project from './Project';

class Organization extends React.Component {

  constructor() {
    super();
    this.state = {
      projects: [],
      name: '',
      mission_statement: '',
    }
  }

  componentDidMount() {
    fetch('http://localhost:8181/organizations/1', {
      method: 'GET'
    })
    .then(response => response.json())
    .then(data => {
      console.log(data)
      this.setState({ projects: data['projects'], name: data.organization.organization_name, mission_statement: data.organization.mission_statement })
    })
  }

  render() {
    return (
      <div className='Organization-show-container'>
        <h1>
          <span className="organization-name-header">{this.state.name}</span>
        </h1>

        <p className="organization-mission-statement">
          {this.state.mission_statement}
        </p>

        <ul>
          {this.state.projects.map( project => <li><Link to={`/projects/${project.id}`}>{project.project_name}</Link></li>)
          }
        </ul>
      </div>
    );
  }
}

export default Organization;