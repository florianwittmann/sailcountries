import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
            signal clicked
            id: root
            height: Theme.itemSizeMedium
            width: parent.width
            color: "transparent"
            border {
                color: Theme.highlightColor
                width: !showAnswerDetails ? 3 : 0
            }
            Item {
                anchors.fill: parent
                anchors.margins: 3

                Rectangle {
                    visible: !showAnswerDetails
                    anchors.fill: parent
                    opacity: mouseArea.pressed ? 0.5 :  0.3
                    color: Theme.highlightColor
                }
                Rectangle {
                    color: answerColor === 0 ? "transparent" : Theme.highlightBackgroundColor
                    opacity: answerColor === 2 ? 0.4 : 0.8
                    anchors.fill: parent
                }

                    Image {
                        id: answerImage
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: answerType === 1 ? answer : ""
                        visible: (showAnswerDetails !== 1 && answerType === 1) ? true : false
                        fillMode: Image.PreserveAspectFit
                    }



                    Column {
                        anchors {
                            left: parent.left
                            leftMargin: Theme.paddingSmall
                            right: imageBlockRight.left
                            rightMargin: Theme.paddingSmall
                            verticalCenter: parent.verticalCenter
                        }
                        Label {
                            id: answerLabel
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            horizontalAlignment:Text.AlignHCenter
                            font.pixelSize: Theme.fontSizeMedium
                            font.family: gameMenuFont.name
                            text: answerType === 0 ? answer : ""
                            visible: answerType === 0 ? true : false
                            wrapMode: Text.WordWrap
                            color: Theme.primaryColor
                        }

                        Label {
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            horizontalAlignment:Text.AlignHCenter
                            text: (showAnswerDetails === 1 &&  askImage === '') ? answerDetails : ""
                            visible: (showAnswerDetails === 1 &&  askImage === '') ? true : false
                            wrapMode: Text.WordWrap
                            color: Theme.highlightColor
                            font.pixelSize: Theme.fontSizeSmall
                            font.family: gameMenuFont.name
                        }
                    }
                    Item {
                        id: imageBlockRight
                        width: answerDetailsImage.visible ? answerDetailsImage.width : questionImageWhenShowingAnswer.width
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right

                        Image {
                            id: answerDetailsImage
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            source: askImage !== '' ? answerDetails : ""
                            visible: (showAnswerDetails === 1 && askImage !== '') ? true : false
                            fillMode: Image.PreserveAspectFit
                        }
                        Image {
                            id: questionImageWhenShowingAnswer
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            source: answerType === 1 ? answer : ""
                            visible: (showAnswerDetails === 1 && answerType === 1) ? true : false
                            fillMode: Image.PreserveAspectFit
                        }




                }

            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    root.clicked()
                }
            }

            FontLoader { id: gameMenuFont; source: "../fonts/peleja-regular-1.0.otf" }

}
