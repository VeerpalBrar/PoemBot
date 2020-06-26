import React from 'react';
import Poem from './poem';

export default class PoemsList extends React.Component {
  render() {
    return (
      <div>
        {this.props.poems.map((poem) => {
          return (<Poem poem={poem} key={poem.id} loggedIn={this.props.loggedIn}/>)
        })}
      </div>
    )
  }
}
