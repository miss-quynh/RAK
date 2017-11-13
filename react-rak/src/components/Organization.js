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
      isToggleOn: true,
      value: ''
    };

    this.handleClick = this.handleClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
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

  handleClick() {
    this.setState(prevState => ({
      isToggleOn: !prevState.isToggleOn
    }));
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    alert('A new project was created: ' + this.state.value);
    event.preventDefault();
  }

  render() {
    if(this.state.isToggleOn){
        <button onClick={this.handleClick}>
          Add New Project
        </button>
      }else{
        <form onSubmit={this.handleSubmit}>
          <label>
            Name:
            <input type="text" value={this.state.value} onChange={this.handleChange} />
          </label>
          <input type="submit" value="Create" />
        </form>
      }

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