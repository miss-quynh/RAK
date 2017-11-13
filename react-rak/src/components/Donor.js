import React from 'react';

import Filter from './Filter';
import Project from './Project';
import axios from 'axios';


class Donor extends React.Component {

  constructor() {
    super();
    this.state = {
      projects: [],
      filters: {}
      }
    }

  componentDidMount() {
    const that = this
    axios.get('http://localhost:8181/projects').then( function(response) {
      const projects = []
      response.data.map( project => projects.push(project))
      that.setState({projects})
    })
  }

  render() {
    return (
      <div>
        <Filter />
        <div className="project-list-container">
          <ul>
            {console.log(this.state)}
            { this.state["projects"].map((project) =>
              <li><Project projectInfo={project}/></li>
            )}
          </ul>
        </div>
      </div>
    );
  }
}

export default Donor;
