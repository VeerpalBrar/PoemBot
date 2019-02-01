import React from 'react';
import Vote from './vote';

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
        console.log(data)
        this.setState({ votes: data.count });
    }.bind(this))
  }
  
  render() {
    return (
      <div className='poem'>
        <div className='left-15'> 
          <Vote count={this.state.votes} voteHandler={this.handleVote} />
        </div>
        
        <div className='left'>
          <h3>{this.props.poem.title || 'Untitled' }</h3>
          <h5>by: {this.props.poem.author|| 'Anonymous'}</h5>
          <div>
            {this.props.poem.content.split("\n").map((i,key) => {
                return <pre key={key}>{i}</pre>;
            })}
          </div>
        </div>
        
      </div>
    )
  }
}