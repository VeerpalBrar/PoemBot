class Poems extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      poems: this.props.poems, 
      title : '', 
      author: '', 
      content: ''
    };
    
    this.handleUserInput = this.handleUserInput.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.addNewPoem = this.addNewPoem.bind(this)
    this.resetState = this.resetState.bind(this)
  }
  
  handleUserInput(obj) {
    this.setState(obj,
    function () {
      // do things after set state in a call back fyi
    });
  }
  
  handleFormSubmit() {
    var poem = {title: this.state.title, author: this.state.author, content: this.state.content}
    $.post('/poems',
      {poem: poem}
      ).done(function(data){
        this.addNewPoem(data);
        this.resetState()
    }.bind(this))
  
  }
  
  addNewPoem(poem){
    console.log(poem)
    var poems = this.state.poems.concat(poem)
    this.setState({ poems: poems.sort(function(a,b){
        return new Date(b.created_at) - new Date(a.created_at);
      })
      
    }, function(){
      console.log(this.state)
    });
  }
  
  resetState(){
    this.setState({
      title : '', 
      author: '', 
      content: ''
    })
  }
  
  render() {
    return (
      <div>
        <PoemForm input_title={this.state.title}
          input_author={this.state.author}
          input_content={this.state.content}
          onUserInput={this.handleUserInput}
          onFormSubmit={this.handleFormSubmit}/>
          
        <PoemsList poems={this.state.poems} />
      </div>
    )
  }
}
