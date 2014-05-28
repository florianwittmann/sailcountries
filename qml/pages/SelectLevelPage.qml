import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game

Page {

    Column {
        id: col
        spacing: Theme.paddingLarge
        width: parent.width
        anchors.fill: parent

        PageHeader {
            id: pH
            title: qsTr('Select difficulty')
        }


        ListView {

            id: lvLevels
            model: levelModel

            width: parent.width
            height: parent.height - pH.height
            anchors.horizontalCenter: parent.horizontalCenter
            boundsBehavior: Flickable.StopAtBounds;
            delegate: ListItem {
                id: listItem
                width: parent.width
                Label {
                    x: Theme.paddingSmall
                    anchors.verticalCenter: parent.verticalCenter
                    font.capitalization: Font.Capitalize
                    color: listItem.highlighted ? Theme.highlightColor : Theme.primaryColor
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: name
                }
                onClicked: {
                    Game.level=(index+2);
                    pageStack.clear();
                    pageStack.replace(Qt.resolvedUrl("GamePage.qml"));
                }
            }
        }


        ListModel {
            id: levelModel

            ListElement {
                name: "Very easy"
            }
            ListElement {
                name: "Easy"
            }
            ListElement {
                name: "Normal"
            }
            ListElement {
                name: "Difficult"
            }
            ListElement {
                name: "Hard"
            }
        }
    }

}

