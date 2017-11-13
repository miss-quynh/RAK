import React from 'react';

class OrganizationLogin extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      email: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    var value = event.target.value;

    this.setState(function () {
      return {
        email: value
      }
    });
  }

  handleSubmit(event) {
    event.preventDefault();

    this.props.onSubmit(
      this.state.email
    );
  }
  render() {
    return (
      <div>
        <form onSubmit = {this.handleSubmit}>
          <label htmlFor = 'email'> {this.props.label} </label>
          <input
            placeholder = 'Enter email'
            type = 'email'
            value = {this.state.email}
            onChange = {this.handleChange}
            ></input>
          <button
            type = 'submit'
            disabled = {!this.state.email}>
              Submit
          </button>
        </form>
      </div>
      )
  }
}

export default OrganizationLogin