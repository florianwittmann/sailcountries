import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"
import "../game.js" as Game
import "../helper.js" as Helper

Page {

    id: welcomePage
    allowedOrientations:  Orientation.All

    SilicaFlickable {

        anchors.fill: parent
        contentHeight:  countryColumn.height + buttons.height
        width: parent.width

        Column {
            id: countryColumn
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            Image {
                anchors.left: parent.left
                anchors.right: parent.right
                fillMode: Image.PreserveAspectFit
                source: "../images/sailcountries_logo.png"
            }
        }

        Column {
            id: buttons
            anchors.top: countryColumn.bottom
            anchors.topMargin: Theme.paddingMedium
            width: parent.width
            GameMenuButton {
               text: qsTr("Scored Game")
               onClicked: {
                   Game.categories = [0,1,2,3];
                   Game.scoredGame = true;
                   pageStack.push(Qt.resolvedUrl("StartGamePage.qml"));
               }
            }
            GameMenuButton {
               text: qsTr("Freestyle Game")
               onClicked: {
                   Game.scoredGame = false;
                   pageStack.push(Qt.resolvedUrl("FreestylePage.qml"))
               }
            }
            GameMenuButton {
               text: qsTr("Highscores")
               onClicked: pageStack.push(Qt.resolvedUrl("ScoresPage.qml"))
            }

            GameMenuButton {
               text: qsTr("Learn")
               onClicked: pageStack.push(Qt.resolvedUrl("StartLearningPage.qml"))
            }

            GameMenuButton {
               text: qsTr("Countries")
               onClicked: pageStack.push(Qt.resolvedUrl("CountriesListPage.qml"))
            }
        }

        PullDownMenu {
            MenuItem {
                text: qsTr("Settings")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
                }
            }
            MenuItem {
                text: qsTr("About")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                }
            }
        }

    }

}



