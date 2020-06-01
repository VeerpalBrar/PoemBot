import React from 'react';
import { FormErrors } from './form_errors';

export default class PoemForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title : '', 
      author: '', 
      content: '', 
      formErrors: {}
    };
    
    this.handleUserInput = this.handleUserInput.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.resetState = this.resetState.bind(this)
  }
  
  handleUserInput(e) {
    const name = e.target.name;
    const obj = {};
    obj[name] = e.target.value;
    this.setState(obj,
    function () {
      // do things after set state in a call back fyi
    });
  }
  
  handleFormSubmit(e) {
    e.preventDefault();
    var poem = {title: this.state.title, author: this.state.author, content: this.state.content}
    $.post('/poems',
      {poem: poem}
      ).done((data) => {
        this.resetState()
    })
    .fail((response) => {
      console.log(response)
      this.setState({formErrors: response.responseJSON})
    })
    e.target.reset();
  }
  
  resetState(){
    this.setState({
      title : '', 
      author: '', 
      content: '', 
      formErrors: {}
    })
  }
  
  render() {
    return (
      <div>
        <h2>Write a new Poem</h2>
        <FormErrors formErrors={this.state.formErrors}/>
        <form onSubmit={this.handleFormSubmit}>
          <input name='title' placeholder='Title' value={this.state.input_title} onChange={this.handleUserInput}/> <br />
          <input name='author' placeholder='Author' value={this.state.input_author} onChange={this.handleUserInput}/> <br />
          <br />
          <textarea name='content' cols='50' rows='10' value={this.state.input_content} onChange={this.handleUserInput}></textarea> <br />
          <input type='submit' value='Create Poem'/>
        </form>        
      </div>
    )
  }
}
