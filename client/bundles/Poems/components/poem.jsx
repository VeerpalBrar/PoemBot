import React from 'react';
import Vote from './vote';
import Grid from '@material-ui/core/Grid';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';

export default class Poem extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = {
      votes: this.voteCount() 
    };
    
    this.handleVote = this.handleVote.bind(this);
    this.voteCount = this.voteCount.bind(this);
  }

  
  handleVote(e) {
    var url = '/poems/'+this.props.poem.id+'/upvote'
    $.post(url,
      ).done(function(data){
         this.setState({ votes: this.voteCount() });
    }.bind(this))
  }
  
  voteCount(){
    var url = '/poems/'+this.props.poem.id+'/upvote_count'
    $.get(url,
    ).done(function(data){
        this.setState({ votes: data.count });
    }.bind(this))
  }

  render() {
    return (
    <div>
      <Paper className="poem">
        <Grid container>
          <Grid item xs={1}>
              <Vote count={this.state.votes} voteHandler={this.handleVote} />
          </Grid>
          <Grid item xs={8} sm container direction="column" spacing={2}>
              <Grid item xs>
                  <Typography variant="h4" component="h3">
                    {this.props.poem.title || 'Untitled' }
                  </Typography>
              </Grid>
              <Grid item>
                <Typography varient="h6">
                  by: {this.props.poem.author|| 'Anonymous'}
                </Typography>
              </Grid>
              <Grid item>
                  {this.props.poem.content.split("\n").map((i,key) => {
                      return <Grid item container wrap="nowrap" key={key}>
                        <Typography varient="body2">{i}</Typography>
                        </Grid>;
                  })}            
              </Grid>
            </Grid>
          </Grid>
      </Paper>
    </div>
  );
  }
}