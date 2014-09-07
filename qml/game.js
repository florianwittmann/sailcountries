.pragma library

Qt.include("countries.js");
Qt.include("gamemodes.js");
Qt.include("difficulties.js");
Qt.include("scoresdb.js");

var countries = getCountriesData();

var gameModeKeys = new Array;
gameModeKeys[0] = "q30"
gameModeKeys[1] = "mis3"
gameModeKeys[2] = "sec60";

var currentQuestion;
var countCorrect = 0;
var countWrong = 0;
var questions = 0;
var gameTime = 0;
var lastStartTime = null;
var playerName ="";


var answering = 0;
var answerOpacity = new Array(4);
var level = 2;
var gameMode = 0;

var featuredCountry = null;

function getUsedTimeLive() {
    if(lastStartTime==null) {
        return gameTime/1000;
    }

    var currentDate = new Date();
    var usedTime = currentDate.getTime() - lastStartTime;
    return (gameTime + usedTime)/1000;
}

function getCurrentFeaturedCountry() {

    if(featuredCountry === null)
        return getNextFeaturedCountry();

    return featuredCountry;
}

function getNextFeaturedCountry() {
    var index = Math.floor(Math.random()* countries.length);
    featuredCountry = countries[index];
    return featuredCountry;
}

function getScore() {
    return countCorrect * 100 - countWrong * 25;
}


function getCountry(id) {
    return(countries[id])
}

function getRandomCountries(count) {
    var countriesToChoose = countries.slice();
    var randomCountries = new Array(count);
    for(var i=0; i<count; i++) {
        var index = Math.floor(Math.random()*countriesToChoose.length);
        randomCountries[i] = countriesToChoose[index];
        countriesToChoose.splice(index,1);
    }
    return randomCountries;
}


function answer(index) {

    if(currentQuestion.correct===index) {
        countCorrect++;
    } else {
        countWrong++;
    }
    questions++;
    return currentQuestion.correct;
}

function checkGameEnd() {

    switch(gameMode) {
    case 0:
        return questions >= 30;
    case 1:
        return countWrong >= 3;
    case 2:
        return gameTime >= 60*1000;
    default:
        return false;
    }

}
function getProgress() {
    var progress=  {
        value: 0,
        max: 100
    }
    switch(gameMode) {
    case 0:
        progress.value = questions;
        progress.max = 30;
        break;
    case 1:
        progress.value = 3-countWrong;
        progress.max = 3;
        break;
    case 2:
        progress.value = (60 - getUsedTimeLive()).toFixed(2);;
        progress.max = "60";
        break;
    }
    return progress;

}

function restartGame() {
    countCorrect = 0;
    countWrong = 0;
    answering = 0;
    questions = 0;
    gameTime = 0;
    lastStartTime = null;
}

function startTimer() {
    var currentDate = new Date();
    lastStartTime = currentDate.getTime();
}

function stopTimer() {
    var currentDate = new Date();
    var usedTime = currentDate.getTime() - lastStartTime;
    gameTime = gameTime + usedTime;
    lastStartTime = null;
}

