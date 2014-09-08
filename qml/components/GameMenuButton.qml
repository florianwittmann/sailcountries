import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: root
    signal clicked
    property alias text: label.text
    property int fontSize: Theme.fontSizeLarge
    height: Theme.itemSizeMedium
    width: parent.width


    border {
        color: Theme.highlightColor
        width: 3
    }
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        opacity: mouseArea.pressed ? 0.5 :  0.3
        color: Theme.highlightColor
    }
    Label {
        id: label
        font.pixelSize: fontSize
        font.family: fontFamilySetting

        anchors {
            left: parent.left
            leftMargin: Theme.paddingSmall
            right: parent.right
            rightMargin: Theme.paddingSmall
            verticalCenter: parent.verticalCenter
        }
        horizontalAlignment:Text.AlignHCenter
        wrapMode: Text.WordWrap
    }


    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
