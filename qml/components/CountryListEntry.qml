import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
            signal clicked
            id: root
            height: Theme.itemSizeLarge
            width: parent.width
            color: "transparent"
            Item {
                anchors.fill: parent

                Rectangle {
                    anchors.fill: parent
                    opacity: mouseArea.pressed ? 0.5 : 0
                    color: Theme.highlightColor
                }


                    Column {
                        anchors {
                            left: parent.left
                            leftMargin: Theme.paddingMedium
                            right: imageRight.left
                            rightMargin: Theme.paddingSmall
                            verticalCenter: parent.verticalCenter
                        }
                        Label {
                            id: answerLabel
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            font.pixelSize: Theme.fontSizeSmall
                            font.family: gameMenuFont.name
                            text: name
                            wrapMode: Text.WordWrap
                            color: Theme.primaryColor
                        }

                        Label {
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            text: capital
                            wrapMode: Text.WordWrap
                            color: Theme.highlightColor
                            font.pixelSize: Theme.fontSizeSmall
                            font.family: gameMenuFont.name
                        }
                    }
                    Image {
                        id: imageRight
                        anchors.top: parent.top
                        anchors.topMargin: Theme.paddingMedium
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: Theme.paddingMedium

                        anchors.right: parent.right
                        anchors.rightMargin: Theme.paddingMedium
                        source:"../../data/flags/" + code.toLowerCase() +".png";
                        fillMode: Image.PreserveAspectFit
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
