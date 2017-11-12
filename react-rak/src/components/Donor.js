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
    axios.get().then( response => console.log(response)).catch(console.log("error"))
  }

  render() {
    return (
      <div>
        <Filter />
        <div className="project-list-container">
          <ul>
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
