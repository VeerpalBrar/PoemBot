import React from 'react';
import Avatar from '@material-ui/core/Avatar';
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    backgroundColor: "green"
  }
});

class Vote extends React.Component {
  constructor(props) {
    super(props);
    this.handleVote = this.handleVote.bind(this);
    this.status = this.status.bind(this);
  }

  handleVote() {
     if(!this.props.disable) {
      this.props.voteHandler();
      this.setState({disable: true});
    }
  }

  status() {
    const { classes } = this.props;
    if(this.props.disable) {
      return classes.root;
    } else {
      return 'active'
    }
  }

  render() {
    return (
      <div className='vote' onClick={this.handleVote}>
        <Avatar className={this.status()}>{this.props.count}</Avatar>
      </div>
    )
  }
}

export default withStyles(styles)(Vote)
