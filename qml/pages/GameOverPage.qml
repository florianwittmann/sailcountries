import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game
import "../scoresdb.js" as ScoresDB


Page {
    id: page

    Column {
        spacing : 10

        width: parent.width

        PageHeader {
            id: gameOverLabel
            title: qsTr("Game Over")
        }

        Label {
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingLarge
            color: Theme.secondaryColor
            text:  qsTr("Your score: %1").arg(Game.getScore());
        }

        TextField {
            anchors.left: parent.left
            anchors.right: parent.right
            id: playerName
            placeholderText: qsTr("Name for highscore")
            text: Game.playerName;
        }

        Button {
           anchors.left: parent.left
           anchors.leftMargin: Theme.paddingLarge
           visible: playerName.text!=="";
           text: qsTr("Save")
           onClicked: afterGameOver()

           function afterGameOver() {
                ScoresDB.saveHighScore(playerName.text, Game.getScore(), Game.gameModeKeys[Game.gameMode], Game.level)
                Game.playerName = playerName.text;
                pageStack.replace(Qt.resolvedUrl("StartPage.qml"))
           }
        }

    }



}





