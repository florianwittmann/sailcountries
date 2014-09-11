import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

import "../game.js" as Game
import "../helper.js" as Helper

import "../scoresdb.js" as ScoresDB


Page {
    id: countryDetail
    property var country

    GamePageHeader {
        id: gameOverLabel
        text: country.name
    }

    Column {
        spacing : 10
        anchors.top: gameOverLabel.bottom
        anchors.topMargin: Theme.paddingLarge
        width: parent.width

        Image {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingLarge
            anchors.leftMargin: Theme.paddingLarge

            source:"../../data/flags/" + country.code.toLowerCase() +".png";
            fillMode: Image.PreserveAspectFit
        }

         GameLabel {
             text: qsTr("capital") + ": " + country.capital
         }

         GameLabel {
             text: qsTr("size") + ": " + Helper.prettifyNumber(country.area) + " km²"
         }

         GameLabel {
             text:  qsTr("population") + ": " + Helper.prettifyNumber(country.population)
         }

    }

    FontLoader { id: gameMenuFont; source: "../fonts/peleja-regular-1.0.otf" }


}





