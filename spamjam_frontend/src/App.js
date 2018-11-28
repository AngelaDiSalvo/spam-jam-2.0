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
  render() {
    if(this.state.loaded){
      return (
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <div>
              <h1>SPAM JAM 2.0</h1>
            </div>
            <div>
              <label>Victim Email</label>
              <input type="text" placeholder="someone@something.com" />
            </div>
            <div>
              <input type="textarea" width="50" height="30" />
            </div>
            <div>
              <select>
                {this.state.allSpamTypes.map(type => (
                  <option key={type.name} value={type.name}>{type.name}</option>
                ))}
                <option value="grapefruit">Grapefruit</option>
                <option value="lime">Lime</option>
                <option selected value="coconut">Coconut</option>
                <option value="mango">Mango</option>
              </select>
            </div>


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
