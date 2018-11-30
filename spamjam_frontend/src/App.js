import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { client_id } from './config.js';
import { loadReCaptcha } from 'react-recaptcha-google'

const SPAM_JAM_API_URL = `http://localhost:3000/spam_types`

class App extends Component {
  state = {
    loaded: false,
    victimEmail: "",
    spamType: "",
    spamNumber: 1,
    allSpamTypes: "",
  }//state

  componentDidMount() {
    loadReCaptcha()
    this.getSpamTypes()
  }//componentDidMount

  saveTheStuff= (data) => {
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

  handleTypeChange = (e) => {
    const foundType = this.state.allSpamTypes.find( type => {
      return type.name === e.target.value
    })
    this.setState({
      spamType: foundType
    })
  }//handleTypeChange

  handleEmailChange = (e) => {
    this.setState({
      victimEmail: e.target.value
    })
  }//handleEmailChange

  handleNumberChange = (e) => {
    this.setState({
      spamNumber: e.target.value
    })
  }

  handleSubmit = (e) => {
    e.preventDefault()

    fetch('http://localhost:3000/spam_emails', {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        spam_email: e.target[0].value,
        type: e.target[1].value,
        contents: e.target[2].value,
        num_emails: e.target[3].value,
      })
    })
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

    let numberArray = []
    for(var i = 1; i <= 50; i++){
      numberArray.push(i)
    }

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
                <input type="text" defaultValue="someone@something.com" onChange={this.handleEmailChange} />
              </div>
              <div>
                <label>Spam Type</label>
                <select onChange={this.handleTypeChange}>
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
                  placeholder="select a spam type"
                  value={this.state.spamType != null ? this.state.spamType.template : ""}
                />
              </div>
              <div>
                <select onChange={this.handleNumberChange}>
                  {numberArray.map(number => (
                    <option key={number} value={number}>{number}</option>
                  ))}
                </select>
              </div>
              <div className="g-recaptcha" data-sitekey={client_id}></div>
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
