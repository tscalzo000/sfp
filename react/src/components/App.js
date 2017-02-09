import React, { Component } from 'react';
import Form from './Form';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      sheet: null,
      user: null,
      clicked: false
    };
    this.componentDidMount = this.componentDidMount.bind(this);
    this.handleClicked = this.handleClicked.bind(this);
  }

  handleClicked(event){
    this.setState({
      clicked: true
    });
  }

  componentDidMount(){
    let pageId = parseInt(document.getElementById('app').dataset.id);
    $.ajax({
      credentials: 'same-origin',
      method: "GET",
      url: `../api/v1/charactersheets/${pageId}.json`
    })
    .done(data => {
      this.setState({
        sheet: data.sheet,
        user: data.user,
      });
    });
    setTimeout(this.componentDidMount, 1000);
  }

  render() {
    if (this.state.sheet !== null) {
      var name = this.state.sheet.name;
      var race = this.state.sheet.race;
      var description = this.state.sheet.description;
      var user = this.state.user.username;
      var age = this.state.sheet.age;
      var alignment = this.state.sheet.alignment;
      var classtype = this.state.sheet.classtype;
      var level = this.state.sheet.level;
      var abilities = this.state.sheet.abilities;
      var backstory = this.state.sheet.backstory;
      var appearance = this.state.sheet.appearance;
      var languages = this.state.sheet.languages;
      var gold = this.state.sheet.gold;
      var equipment = this.state.sheet.equipment;
      var weapons = this.state.sheet.weapons;
      var spells = this.state.sheet.spells;
      var other = this.state.sheet.other;
      if (this.state.sheet.url !== '' && this.state.sheet.url !== null) {
        var url = this.state.sheet.url;
      } else {
        var url = 'https://pbs.twimg.com/profile_images/1724449330/stick_man_by_minimoko94-d2zvfn8.png';
      }
    }
    if (this.state.clicked === false) {
      return(
        <div>
          <div className='medium-2 columns float-right'>
            <img src={url}></img>
            <hr/><button id='button' onClick={event => {event.preventDefault(), this.handleClicked();}}>Edit</button><br/>
          </div>
          <div className='medium-10 columns float-left'>
            <b>Creator:</b> {user}<br/>
            <b>Character Name:</b> {name}<br/>
            <b>Race:</b> {race}<br/>
            <b>Age:</b> {age}<br/>
            <b>Alignment:</b> {alignment}<br/>
            <b>Class:</b> {classtype}<br/>
            <b>Level:</b> {level}<br/>
          </div>

          <b>Abilities:</b> {abilities}<br/>
          <b>Description:</b> {description}<br/>
          <b>Backstory:</b> {backstory}<br/>
          <b>Appearance:</b> {appearance}<br/>
          <b>Languages:</b> {languages}<br/>
          <b>Gold:</b> {gold}<br/>
          <b>Equipment:</b> {equipment}<br/>
          <b>Weapons:</b> {weapons}<br/>
          <b>Spells:</b> {spells}<br/>
          <b>Other:</b> {other}<br/>

        </div>
      );
    } else {
      return(
        <div>
          <Form />
        </div>
      );
    }
  }
}

export default App;
