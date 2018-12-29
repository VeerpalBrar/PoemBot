class Poem extends React.Component {
  render() {
    return (
      <div className='poem'>
        <h3>{this.props.poem.title || 'Untitled' }</h3>
        <h5>by: {this.props.poem.author|| 'Anonymous'}</h5>
        <p>{this.props.poem.content}</p>
      </div>
    )
  }
}