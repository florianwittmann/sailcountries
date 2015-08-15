import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"
import "../game.js" as Game
import "../helper.js" as Helper
import "../gamemodes.js" as Gamemodes
import "../difficulties.js" as Difficulties

Page {

    id: startNewGamePage
    allowedOrientations:  Orientation.All
    property bool isChooseGameModesVisible: true
    property bool isChooseDifficultyVisible: false

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

        SettingsChooser {
            id: gameMode
            title: qsTr("Game mode")
            currentIndex: Game.gameMode
            //choosedSetting: Gamemodes.gamemodes[Game.gameMode].name
            onClicked: {
                if (isChooseDifficultyVisible)
                    return
                gameMode.choosedSetting = ""
                isChooseGameModesVisible = true
                isChooseDifficultyVisible = false
            }
        }

        Repeater {
            model: gamemodes
            delegate: GameMenuButton {
                text: name
                visible: isChooseGameModesVisible
                onClicked: {
                    gameMode.choosedSetting = name
                    gameMode.currentIndex = index
                    isChooseGameModesVisible = false
                    isChooseDifficultyVisible = difficulty.choosedSetting === ""
                }
            }
        }

        SettingsChooser {
            id: difficulty
            currentIndex: Game.level
            visible: difficulty.choosedSetting !== "" || gameMode.choosedSetting !== ""
            title: qsTr("Difficulty")
            onClicked: {
                if (isChooseGameModesVisible)
                    return
                difficulty.choosedSetting = ""
                isChooseDifficultyVisible = true
                isChooseGameModesVisible = false
            }
        }

        Repeater {
            model: difficulties
            delegate: GameMenuButton {
                text: name
                visible: isChooseDifficultyVisible
                onClicked: {
                    difficulty.choosedSetting = name
                    difficulty.currentIndex = index
                    isChooseDifficultyVisible = false
                }
            }
        }
    }
    GameMenuButton {
        anchors.bottom: parent.bottom
        text: qsTr("Start")
        visible: !isChooseDifficultyVisible && !isChooseGameModesVisible
        onClicked: {
            Game.restartGame()
            Game.level = difficulty.currentIndex
            Game.gameMode = gameMode.currentIndex
            pageStack.replaceAbove(null, Qt.resolvedUrl("GamePage.qml"))
        }
    }

    ListModel {
        id: difficulties
    }
    ListModel {
        id: gamemodes
    }
    Component.onCompleted: {
        for (var i = 0; i < Difficulties.difficulties.length; i++) {
            difficulties.append(Difficulties.difficulties[i])
        }
        for (var j = 0; j < Gamemodes.gamemodes.length; j++) {
            gamemodes.append(Gamemodes.gamemodes[j])
        }
    }
}
