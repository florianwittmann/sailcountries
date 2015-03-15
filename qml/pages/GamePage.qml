import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game
import "../questions.js" as Questions
import "../components"

Page {
    id: gamePage

    property string askText: ''
    property string askImage: ''
    property string currentScore: ''
    property string currentProgress: ''
    property bool isWaitingForAnswer: true

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
                    font.family: fontFamilySetting
                    color: Theme.secondaryHighlightColor
                }

                Label {
                    anchors.right: parent.right
                    anchors.rightMargin: Theme.paddingMedium
                    anchors.top: parent.top
                    anchors.topMargin: Theme.paddingMedium

                    id: progress
                    text: currentProgress
                    font.pixelSize: Theme.fontSizeSmall
                    font.family: fontFamilySetting
                    color: Theme.secondaryHighlightColor
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
                font.family: fontFamilySetting
            }
            Image {
                id: askQuestionImage
                anchors.horizontalCenter: parent.horizontalCenter
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

        delegate: AnswerButton {
            onClicked: clickHandler(index)
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


        MouseArea {
            visible: !isWaitingForAnswer
            anchors.fill: parent
            onClicked: {
                if (Game.checkGameEnd()) {
                    gameOver()
                } else {
                    Game.answering = 0
                    isWaitingForAnswer = true
                    loadNewQuestion()
                }
            }
        }
    }

    Component.onCompleted: {
        loadNewQuestion()
        showProgress(Game.getProgress())
    }

    function clickHandler(index) {
        if (Game.answering === 0) {
            Game.stopTimer()
            progressTimer.stop()
            Game.answering = 1
            Game.answer(index)
            isWaitingForAnswer = false

            showAnswer(Game.currentQuestion.correct, index)
            showProgress(Game.getProgress())
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

        var answerCount = Game.level + 2;
        var countriesForQuestion = Game.getRandomCountries(answerCount);
        var categories = Game.categories;
        var question = Questions.Questions.getQuestion(answerCount, countriesForQuestion, categories)
        Game.currentQuestion = question;

        askText = question.ask

        if (question.questiontype === 1) {
            askImage = question.image
        } else {
            askImage = ''
        }

        listViewModel.clear()
        for (var i = 0; i < question.answers.length; i++) {

            var questionModel = {

            }

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
