// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
//
// ELM code import
import Elm from '../../elm/Main.elm';
import { initSearch } from './googlePlaces';
import '../css/app.css';


const elmDiv = document.getElementById('elm-target');
const app = Elm.Main.embed(elmDiv);

app.ports.initPlacesSearch.subscribe(function() {
  const container = document.getElementById('placesearch');
  if(container == undefined ){
    console.log("Google Place Not loaded")
  }
  else {
    initSearch(container, function(name) {
      app.ports.placeSuggestion.send(name);
    })
  }

});
