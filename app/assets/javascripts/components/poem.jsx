class Poem extends React.Component {
  render() {
    return (
      <div className='poem'>
        <h3>{this.props.poem.title || 'Untitled' }</h3>
        <h5>by: {this.props.poem.author|| 'Anonymous'}</h5>
        <div>
          {this.props.poem.content.split("\n").map((i,key) => {
              return <pre key={key}>{i}</pre>;
          })}
        </div>
      </div>
    )
  }
}