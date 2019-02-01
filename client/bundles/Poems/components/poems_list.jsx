import React from 'react';
import Poem from './poem';

export default class PoemsList extends React.Component {
  render() {
    return (
      <div>
        {this.props.poems.map(function(poem) {
          return (<Poem poem={poem} key={poem.id}/>)
        })}
      </div>
    )
  }
}
