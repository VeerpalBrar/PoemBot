import React from 'react';
import Avatar from '@material-ui/core/Avatar';

export default class Vote extends React.Component {
  constructor(props) {
    super(props);
    this.handleVote = this.handleVote.bind(this);
  }

  handleVote() {
    if(!this.props.disable) {
      this.props.voteHandler();
      this.setState({disable: true});
    }
  }

  render() {
    return (
      <div className='vote' onClick={this.handleVote}>
        <Avatar>{this.props.count}</Avatar>
      </div>
    )
  }
}
