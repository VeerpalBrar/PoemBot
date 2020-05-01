import React from 'react';
import Avatar from '@material-ui/core/Avatar';

export default class Vote extends React.Component {
  render() {
    return (
      <div className='vote' onClick={this.props.voteHandler}>
        <Avatar>{this.props.count}</Avatar>
      </div>
    )
  }
}