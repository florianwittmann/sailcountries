import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"
import "../game.js" as Game
import "../helper.js" as Helper
import "../learnmodes.js" as Learnmodes

Page {

    id: startNewGamePage
    property bool isChooseLearnModeVisible: true

    Column {
        id: countryColumn
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        Image {
            source: "../images/sailcountries_logo.png"
        }

        SettingsChooser {
            id: learnMode
            title: qsTr("Learn")
            currentIndex: 0
            onClicked: {
                learnMode.choosedSetting = ""
                isChooseLearnModeVisible = true
            }
        }

        Repeater {
            model: learnmodes
            delegate: GameMenuButton {
                text: name
                visible: isChooseLearnModeVisible
                onClicked: {
                    learnMode.choosedSetting = name
                    learnMode.currentIndex = index
                    isChooseLearnModeVisible = false
                }
            }
        }
    }
    GameMenuButton {
        anchors.bottom: parent.bottom
        text: qsTr("Start")
        visible: !isChooseLearnModeVisible
        onClicked: {
            pageStack.replaceAbove(null, Qt.resolvedUrl("LearnCountry.qml"),{"learnMode":learnMode.currentIndex,"learnModeTitle":learnMode.choosedSetting})
        }
    }

    ListModel { id: learnmodes }

    Component.onCompleted: {
        for (var i = 0; i < Learnmodes.learnmodes.length; i++) {
            learnmodes.append(Learnmodes.learnmodes[i])
        }
    }

}
