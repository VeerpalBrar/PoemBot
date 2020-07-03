import React from 'react';
import { TextField, Button } from '@material-ui/core';
import PoemForm from './poem_form';
import PoemsList from './poems_list';

export default class Poems extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      poems: this.props.poems,
      query: '', 
    };
    
    this.handleOnInputChange = this.handleOnInputChange.bind(this)
    this.search = this.search.bind(this)
    this.handleButtonClick = this.handleButtonClick.bind(this)

  }
  
  search(page = 1) {
    $.get('/poems/search?query='+this.state.query+'&page='+page)
    .done((data) => {
        this.setState({poems: data })
    })
    .fail((response) => {
      console.log(response)
    })
  }

  handleButtonClick(event) {
    this.search();
  }
  
  handleOnInputChange = (event) => {
    const query = event.target.value;
    this.setState({ query: query }, () => this.search());
  };
  
  render() {
    return (
      <div className="container">
        <TextField id="standard-search" label="Search" type="search" defaultValue={this.state.query} onChange={this.handleOnInputChange} size={'medium'} />
        <Button size="small" onClick={this.handleButtonClick}>Search</Button>

        <PoemsList poems={this.state.poems} onPageChange={this.search}/>
      </div>
    )
  }
}
