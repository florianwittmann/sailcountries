import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

import "../game.js" as Game
import "../scoresdb.js" as ScoresDB


Page {
    id: gameOverPage


    GamePageHeader {
        id: gameOverLabel
        text: qsTr("Game Over")
    }


    Column {
        spacing : 10
        anchors.top: gameOverLabel.bottom
        anchors.topMargin: Theme.paddingLarge
        width: parent.width


        GameLabel {
            text:  qsTr("Your score: %1").arg(Game.getScore());
        }

        TextField {
            visible: Game.scoredGame
            anchors.left: parent.left
            anchors.right: parent.right
            id: playerName
            placeholderText: qsTr("Name for highscore")
            font.family: fontFamilySetting
            text: Game.playerName;
        }

        GameMenuButton {
           visible: playerName.text!=="";
           text: Game.scoredGame ? qsTr("Save") : qsTr("Continue")
           onClicked: afterGameOver()

           function afterGameOver() {
                if(Game.scoredGame ) {
                    ScoresDB.saveHighScore(playerName.text, Game.getScore(), Game.gameModeKeys[Game.gameMode], Game.level)
                    Game.playerName = playerName.text;
                }
                pageStack.replace(Qt.resolvedUrl("StartPage.qml"))
           }
        }

    }



}





