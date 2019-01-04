class Vote extends React.Component {
  render() {
    return (
      <div className='vote' onClick={this.props.voteHandler}>
        {this.props.count}
      </div>
    )
  }
}