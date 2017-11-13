import React from 'react';

import Filter from './Filter';
import Project from './Project';
import OrganizationDonor from './OrganizationDonor';
import axios from 'axios';


class Donor extends React.Component {

  constructor() {
    super();
    this.state = {
      projects: [],
      organizations: [],
      view: "projects",
      filters: {
        categories: [],
        zipcode: "",
        events: [],
        type: []
      },
    }

    this.projectsCall = this.projectsCall.bind(this)
    this.conditionalTabShow = this.conditionalTabShow.bind(this)
    this.handleProjectsClick = this.handleProjectsClick.bind(this)
    this.handleOrganizationsClick = this.handleOrganizationsClick.bind(this)

  }

  projectsCall() {
    const that = this
    axios.get('http://localhost:8181/projects').then( function(response) {
      const projects = []
      response.data.map( project => projects.push(project) )
      that.setState({projects})
    })
  }

  organizationsCall(){
    const that = this
    axios.get('http://localhost:8181/organizations').then( function(response) {
      const organizations = []
      response.data.map( organization => organizations.push(organization) )
      that.setState({organizations})
    })
  }

  componentDidMount() {
    this.projectsCall();
    this.organizationsCall();
  }

  handleProjectsClick() {
    let view = this.state.view
    view = "projects"
    this.setState({view})
  }

  handleOrganizationsClick() {
    let view = this.state.view
    view = "organizations"
    this.setState({view})
  }

  conditionalTabShow () {

    if(this.state.view === 'projects'){
    return (
        <div className="donor-view-list-container">
          <ul>
            { this.state["projects"].map((project) =>
              <li><Project projectInfo={project}/></li>
            )}
          </ul>
        </div>
      )
    }

    if(this.state.view === 'organizations') {
      return (
        <div className="donor-view-list-container">
          <ul>
            { this.state["organizations"].map((organization) =>
              <li><OrganizationDonor orgInfo={organization}/></li>
            )}
          </ul>
        </div>
      )
    }
  }

  render() {
    return (
      <div>
        <div className="proj-org-btn-container">
          <button className="tab" onClick={this.handleProjectsClick}>Projects</button>
          <button className="tab" onClick={this.handleOrganizationsClick}>Organizations</button>
        </div>
        <Filter />
        {this.conditionalTabShow()}
      </div>
    );
  }
}

export default Donor;
