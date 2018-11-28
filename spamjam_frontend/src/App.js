import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

const SPAM_JAM_API_URL = `http://localhost:3000/spam_types`

class App extends Component {
  state = {
    loaded: false,
    victimEmail: "",
    spamMessage: "",
    spamType: "",
    spamNumber: 1,
    allSpamTypes: "",
  }//state

  componentDidMount(){
    this.getSpamTypes()
  }//componentDidMount

  saveTheStuff=(data)=> {
    this.setState({
      allSpamTypes: data,
      loaded: true,
    })
  }

  getSpamTypes = () => {
    fetch(SPAM_JAM_API_URL)
    .then(data => data.json())
    .then(this.saveTheStuff)
  }
  makeTypeOptions(){
    //map all these into <options>
  }

  handleChange = (e) => {
    const foundType = this.state.allSpamTypes.find( type => {
      return type.name === e.target.value
    })
    this.setState({
      spamType: foundType
    })
  }//handleChange

  handleSubmit = (e) => {

  }//handleSubmit

  render() {
    const style = {
      maxHeight:'400px',
      minHeight:'400px',
      resize:'none',
      padding:'9px',
      boxSizing:'border-box',
      fontSize:'15px'
    };

    if(this.state.loaded){
      return (
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <div>
              <h1>SPAM JAM 2.0</h1>
            </div>
            <form onSubmit={this.handleSubmit}>
              <div>
                <label>Victim Email</label>
                <input type="text" placeholder="someone@something.com" />
              </div>
              <div>
                <select onChange={this.handleChange}>
                  <option key="blank" value="blank" default></option>
                  {this.state.allSpamTypes.map(type => (
                    <option key={type.name} value={type.name}>{type.name}</option>
                  ))}
                </select>
              </div>
              <br></br>
              <div>
                <textarea
                  style={style}
                  placeholder="message"
                  value={this.state.spamType != null ? this.state.spamType.template : ""}
                />
              </div>
              <div>
                <input type="submit" value="Submit" />
              </div>
            </form>



          </header>
        </div>
      );
    }
    else{
      return (
        <p>LOADING THING HERE...</p>
      );
    }

  }//render
}

export default App;
