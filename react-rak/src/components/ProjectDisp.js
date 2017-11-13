import React from 'react';

class ProjectDisp extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <p>ProjectDisp</p>

        <span> {console.log(this.props)}</span>
      </div>
    );
  }
}
export default ProjectDisp;