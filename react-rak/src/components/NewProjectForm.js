import React from 'react';
import { BrowserRouter as Router, Link, Route, Switch } from 'react-router-dom';
import Project from './Project';

class NewProjectForm extends React.Component {

  constructor() {
    super();
    this.state = {
      newProjectForm: {
        name: '',
        streetAddress: '',
        city: '',
        state: '',
        zipCode: ''
      }
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event, fieldName) {
    const newProjectForm = {...this.state.newProjectForm}
    newProjectForm[fieldName] = event.target.value
    this.setState({newProjectForm});
  }

  handleSubmit(event) {
    event.preventDefault();
  }

  render() {
    if(this.props.displayNewProjectForm === false){
      return (
        <button onClick={this.props.toggleProjectFormState}>
          Add New Project
        </button>
    )} else {
      return (
        <form onSubmit={this.handleSubmit}>
          <label>
            Name:
            <input type="text" value={this.state.newProjectForm.name} onChange={(e) => this.handleChange(e, "name")} />
          </label>
          <label>
            Street Address:
            <input type="text" value={this.state.newProjectForm.streetAddress} onChange={(e) => this.handleChange(e, "streetAddress")} />
          </label>
          <label>
            City:
            <input type="text" value={this.state.newProjectForm.city} onChange={(e) => this.handleChange(e, "city")} />
          </label>
          <label>
            State:
            <input type="text" value={this.state.newProjectForm.state} onChange={(e) => this.handleChange(e, "state")} />
          </label>
          <label>
            Zip Code:
            <input type="text" pattern="[0-9]{5}" title="Five digit zip code" value={this.state.newProjectForm.zipCode} onChange={(e) => this.handleChange(e, "zipCode")} />
          </label>
          <input type="submit" value="Create" />
        </form>
        )
      }
  }
}

export default NewProjectForm;