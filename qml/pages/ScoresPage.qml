import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game
import "../scoresdb.js" as ScoresDB


Page {
    id: page

    SilicaFlickable {
        id: flickable
        anchors.fill: parent
        contentWidth: col.width
        contentHeight: col.height + col.y

        PageHeader {

            id: header
            title: qsTr("Highscores")
        }

        Column {
            width: page.width
            id: col
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingSmall

            anchors.top: header.bottom
            anchors.topMargin: Theme.paddingLarge

            Component.onCompleted: getScores()

            function getScores() {
                for (var j = 0; j < Game.gameModeKeys.length; j++) {

                    Qt.createQmlObject(
                                'import QtQuick 2.0; import Sailfish.Silica 1.0; Label {font.pixelSize: Theme.fontSizeLarge; color: Theme.highlightColor;text:"'
                                + Game.gamemodes[Game.gameModeKeys[j]] + '"}',
                                col, "dynamicSnippet")

                    var scores = ""

                    for (var i = Object.keys(Game.difficulties).length - 1; i >= 0; i--) {
                        var score = ScoresDB.getHighScoreList(Game.gameModeKeys[j], i)
                        if (score !== "")
                            scores = scores + Game.difficulties[i] + ':\n' + score + '\n'
                    }

                    Qt.createQmlObject(
                                'import QtQuick 2.0; import Sailfish.Silica 1.0; Label {font.pixelSize: Theme.fontSizeSmall; text:"' + scores + '";}',
                                col, "dynamicSnippet")
                }
                return scores
            }
        }
        VerticalScrollDecorator {
            flickable: flickable
        }
    }
}
