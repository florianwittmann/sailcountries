import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game
import "../questions.js" as Questions

Page {
    id: gamePage

    property string askText : ''
    property string askImage : ''
    property string currentScore : ''
    property string currentProgress : ''

    SilicaListView {
        id: gamePageList
        model: listViewModel
        anchors.fill: parent
        header: Column {
            spacing: Theme.paddingSmall
            width: gamePage.width

            Rectangle {
                width: parent.width
                height: Theme.itemSizeSmall
                color: "transparent"

                Label {
                    anchors.left: parent.left
                    anchors.leftMargin: Theme.paddingMedium
                    anchors.top: parent.top
                    anchors.topMargin: Theme.paddingMedium
                    id: scoreLabel
                    text: currentScore
                    font.pixelSize: Theme.fontSizeSmall
                }

                Label {
                    anchors.right: parent.right
                    anchors.rightMargin: Theme.paddingMedium
                    anchors.top: parent.top
                    anchors.topMargin: Theme.paddingMedium

                    id: progress
                    text: currentProgress
                    font.pixelSize: Theme.fontSizeSmall
                }
            }

            Label {
                id: askQuestionText
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingMedium
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingMedium
                wrapMode: Text.WordWrap
                font.bold: true
                color: Theme.highlightColor
                text: askText
            }
            Image {
                id: askQuestionImage
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingMedium
                visible: askImage !== ''
                fillMode: Image.PreserveAspectFit
                width: 200
                source: askImage
            }
            Rectangle {
                width: parent.width
                height: Theme.paddingMedium
                color: "transparent"
            }
        }

        PullDownMenu {
            MenuItem {
                text: qsTr("Cancel current game")
                onClicked: {
                    pageStack.replace(Qt.resolvedUrl("StartPage.qml"))
                }
            }
        }

        delegate: BackgroundItem {
            id: delegate
            height: Theme.itemSizeMedium
            Rectangle {
                color: answerColor === 0 ? "transparent" : Theme.highlightBackgroundColor
                opacity: answerColor === 2 ? 0.6 : 1.0
                height: Theme.itemSizeMedium
                width: parent.width

                Column {
                    Label {
                        id: answerLabel

                        anchors.left: parent.left
                        anchors.leftMargin: Theme.paddingLarge
                        anchors.right: parent.right
                        anchors.rightMargin: Theme.paddingLarge

                        text: answerType === 0 ? answer : ""
                        visible: answerType === 0 ? true : false
                        wrapMode: Text.WordWrap
                        color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                    }

                    Label {

                        anchors.left: parent.left
                        anchors.leftMargin: Theme.paddingLarge
                        anchors.right: parent.right
                        anchors.rightMargin: Theme.paddingLarge

                        text: showAnswerDetails === 1 ? answerDetails : ""
                        visible: showAnswerDetails === 1 ? true : false
                        wrapMode: Text.WordWrap
                        color: Theme.secondaryColor
                    }
                }

                Image {
                    anchors.left: parent.left
                    anchors.leftMargin: Theme.paddingLarge
                    anchors.top: parent.top
                    anchors.topMargin: Theme.paddingSmall
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: Theme.paddingSmall

                    source: answerType === 1 ? answer : ""
                    visible: answerType === 1 ? true : false
                    fillMode: Image.PreserveAspectFit
                }
            }

            onClicked: {
                clickHandler(index)
            }
        }
        VerticalScrollDecorator {
        }

        ListModel {
            id: listViewModel
        }

        Timer {
            id: progressTimer
            interval: 50
            running: false
            repeat: true
            onTriggered: handleTimeProgressDuringQuestion()

            function handleTimeProgressDuringQuestion() {
                var progress = Game.getProgress()
                if (progress.value <= 0) {
                    progressTimer.stop()
                    Game.stopTimer()
                    gameOver()
                } else {
                    showProgress(progress)
                }
            }
        }

    }

    function clickHandler(index) {
        if (Game.answering === 0) {
            Game.stopTimer()
            progressTimer.stop()
            Game.answering = 1
            Game.answer(index)

            showAnswer(Game.currentQuestion.correct, index)
            showProgress(Game.getProgress())
        } else {
            if (Game.checkGameEnd()) {
                gameOver()
            } else {
                Game.answering = 0
                loadNewQuestion()
            }
        }
    }

    function showAnswer(correctAnswer, myAnswer) {

        listViewModel.clear()
        for (var i = 0; i < Game.currentQuestion.answers.length; i++) {

            var model = {

            }
            model.answer = Game.currentQuestion.answers[i]
            model.answerType = Game.currentQuestion.type
            if (i === correctAnswer) {
                model.answerColor = 1
            } else if (i === myAnswer && myAnswer !== correctAnswer) {
                model.answerColor = 2
            } else {
                model.answerColor = 0
            }

            model.answerDetails = typeof Game.currentQuestion.answerDetails
                    !== "undefined" ? String(
                                          Game.currentQuestion.answerDetails[i]) : ""
            model.showAnswerDetails = 1
            listViewModel.append(model)
        }
    }

    function loadNewQuestion() {
        var question = Questions.getQuestion(Game.level + 2,
                                             Game.getRandomCountries(
                                                 Game.level + 2))
        Game.currentQuestion = question
        askText = question.ask

        if (question.questiontype === 1) {
            askImage = question.image
        } else {
            askImage = ''
        }

        listViewModel.clear()
        for (var i = 0; i < question.answers.length; i++) {

            var questionModel = {}

            questionModel.answer = question.answers[i]
            questionModel.answerType = question.type
            questionModel.answerColor = 0
            questionModel.answerDetails = ""
            questionModel.showAnswerDetails = 0
            listViewModel.append(questionModel)
        }
        Game.startTimer()
        if (Game.gameMode == 2) {
            progressTimer.start()
        }

    }

    function showProgress(progress) {
        currentScore = qsTr("Score: %1").arg(Game.getScore())
        currentProgress = progress.value + "/" + progress.max
    }

    function gameOver() {
        pageStack.replace(Qt.resolvedUrl("GameOverPage.qml"))
    }
}
