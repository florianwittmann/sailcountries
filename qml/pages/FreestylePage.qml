import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"
import "../game.js" as Game
import "../helper.js" as Helper
import "../learnmodes.js" as Learnmodes

Page {

    id: startNewGamePage
    property bool isChooseGameModesVisible: true
    property bool isChooseDifficultyVisible: false

    property var choosedQuestionTypes: []
    property int choosedCount: 0

    Column {
        id: countryColumn
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        Image {
            source: "../images/sailcountries_logo.png"
        }

        GamePageHeader {
            text: qsTr("Questions")
        }

        Repeater {
            model: questionsTypes
            delegate: GameMenuButton {
                text: name
                opacity: choosedQuestionTypes.indexOf(index) > -1 ? 1.0 : 0.5
                onClicked: clickOption(index)
            }
        }
    }



    GameMenuButton {
        anchors.bottom: parent.bottom
        text: qsTr("Continue")
        visible: choosedCount > 0
        onClicked: {
            Game.categories = choosedQuestionTypes;
            pageStack.push(Qt.resolvedUrl("StartGamePage.qml"))
        }
    }


    ListModel {
        id: questionsTypes
    }
    Component.onCompleted: {
        for (var j = 0; j < Learnmodes.learnmodes.length; j++) {
            questionsTypes.append(Learnmodes.learnmodes[j])
        }
    }

    function clickOption(index) {
        var newChoosedQuestionTypes = choosedQuestionTypes;
        var pos = newChoosedQuestionTypes.indexOf(index);
        if(pos > -1) {
            newChoosedQuestionTypes.splice(pos, 1);
        } else {
            newChoosedQuestionTypes.push(index);
        }
        choosedQuestionTypes=[];
        choosedQuestionTypes= newChoosedQuestionTypes;
        choosedCount = choosedQuestionTypes.length;
    }

}
