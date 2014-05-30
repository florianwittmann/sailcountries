import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game

Dialog {
    id: dialogPage

    canAccept: difficulty.currentIndex >= 0 && gameMode.currentIndex >= 0

    acceptDestination:  gamePage
    acceptDestinationAction: PageStackAction.Replace
    acceptDestinationReplaceTarget: null
    onAccepted: {
        Game.restartGame()
        Game.level = difficulty.currentIndex
        Game.gameMode = gameMode.currentIndex
        gamePage.loadNewQuestion()
        gamePage.showProgress(Game.getProgress())
    }

    SilicaListView {
        anchors.fill: parent

        header: DialogHeader {
            acceptText: qsTr("Start")
        }

        model: VisualItemModel {

            ComboBox {
                currentIndex: Game.gameMode
                id: gameMode
                width: dialogPage.width
                label: qsTr("Game mode")

                menu: ContextMenu {
                    MenuItem { text: qsTr("30 questions") }
                    MenuItem { text: qsTr("3 mistakes") }
                    MenuItem { text: qsTr("60 seconds") }
                }
            }

            ComboBox {
                currentIndex: Game.level
                width: dialogPage.width
                label: qsTr("Difficulty")
                id: difficulty

                menu: ContextMenu {
                    MenuItem { text: qsTr("Very easy") }
                    MenuItem { text: qsTr("Easy") }
                    MenuItem { text: qsTr("Normal") }
                    MenuItem { text: qsTr("Difficult") }
                    MenuItem { text: qsTr("Hard") }
                }
            }

        }
    }

}



