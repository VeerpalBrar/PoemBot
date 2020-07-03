import React from 'react';
import ReactPaginate from 'react-paginate';
import Poem from './poem';

export default class PoemsList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      poems: this.props.poems,
      page: 1
    };
    this.handlePageChange = this.handlePageChange.bind(this);
    
  }

  componentWillReceiveProps(nextProps) {
    this.setState({ poems: nextProps.poems });  
  }

  handlePageChange(event) {
    const page = event.selected + 1;
    this.setState({page: page});
    this.props.onPageChange(page);
  }

  render() {
    return (
      <div key={this.state.poems}>
        {this.state.poems.map((poem) => {
          return (<Poem poem={poem} key={poem.id} loggedIn={this.props.loggedIn}/>)
        })}
        <ReactPaginate
          previousLabel={'previous'}
          nextLabel={'next'}
          breakLabel={'...'}
          breakClassName={'break-me'}
          pageCount={4}
          marginPagesDisplayed={1}
          pageRangeDisplayed={4}
          onPageChange={this.handlePageChange}
          containerClassName={'pagination'}
          subContainerClassName={'pages pagination'}
          activeClassName={'active'}
        />
     </div>
    )
  }
}
