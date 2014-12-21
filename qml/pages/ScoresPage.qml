import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"
import "../game.js" as Game
import "../difficulties.js" as Difficulties
import "../gamemodes.js" as Gamemodes
import "../scoresdb.js" as ScoresDB


Page {
    id: scoresPage

    GamePageHeader {
        id: header
        text: qsTr("Highscores")
    }

    SilicaFlickable {
        id: flickable
        anchors {
            top: header.bottom
            topMargin: Theme.paddingLarge
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        clip: true
        contentWidth: col.width
        contentHeight: col.height + col.y


        Column {
            width: page.width
            id: col
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingSmall

            anchors.top: header.bottom
            anchors.topMargin: Theme.paddingLarge

            Component.onCompleted: getScores()

            function getScores() {
                for (var j = 0; j < Gamemodes.gamemodes.length; j++) {

                    Qt.createQmlObject(
                                'import QtQuick 2.0; import Sailfish.Silica 1.0; Label {font.pixelSize: Theme.fontSizeLarge;font.family: fontFamilySetting; color: Theme.highlightColor;text:"'
                                + Game.gamemodes[j].name + '"}',
                                col, "dynamicSnippet")

                    var scores = ""

                    for (var i = Difficulties.difficulties.length - 1; i >= 0; i--) {
                        var score = ScoresDB.getHighScoreList(Game.gamemodes[j].id, i)
                        if (score !== "")
                            scores = scores + Difficulties.difficulties[i].name + ':\n' + score + '\n'
                    }

                    Qt.createQmlObject(
                                'import QtQuick 2.0; import Sailfish.Silica 1.0; Label {font.pixelSize: Theme.fontSizeSmall;font.family: fontFamilySetting;color: Theme.secondaryHighlightColor; text:"' + scores + '";}',
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
