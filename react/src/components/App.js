import React, { Component } from 'react';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      sheet: null,
      user: null
    };
    this.componentDidMount = this.componentDidMount.bind(this);
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
        user: data.user
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
    }

    return(
      <div>
        User: {user}<br/>
        Character Name: {name}<br/>
        Race: {race}<br/>
        Age: {age}<br/>
        Alignment: {alignment}<br/>
        Class: {classtype}<br/>
        Level: {level}<br/>
        Abilities: {abilities}<br/>
        Description: {description}<br/>
        Backstory: {backstory}<br/>
        Appearance: {appearance}<br/>
        Languages: {languages}<br/>
        Gold: {gold}<br/>
        Equipment: {equipment}<br/>
        Weapons: {weapons}<br/>
        Spells: {spells}<br/>
        Other: {other}<br/>
      </div>
    );
  }
}

export default App;
