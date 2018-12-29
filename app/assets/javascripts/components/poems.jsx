class Poems extends React.Component {
  render() {
    return (
      <div>
        {this.props.poems.map(function(poem) {
          return (<Poem poem={poem} />)
        })}
      </div>
    )
  }
}
