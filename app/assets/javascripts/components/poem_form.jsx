class PoemForm extends React.Component {
   constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  
  handleChange(e) {
    var name = e.target.name;
      obj = {};
      obj[name] = e.target.value;
      this.props.onUserInput(obj);
  }
  
  handleSubmit(e) {
    e.preventDefault();
    this.props.onFormSubmit();
    e.target.reset();
  }
  
  render() {
    return (
      <div>
        <h2>Write a new Poem</h2>
        <form onSubmit={this.handleSubmit}>
          <input name='title' placeholder='Title' value={this.props.input_title} onChange={this.handleChange}/> <br />
          <input name='author' placeholder='Author' value={this.props.input_author} onChange={this.handleChange}/> <br />
          <br />
          <textarea name='content' cols='50' rows='10' value={this.props.input_content} onChange={this.handleChange}></textarea> <br />
          <input type='submit' value='Create Poem'/>
        </form>        
      </div>
    )
  }
}