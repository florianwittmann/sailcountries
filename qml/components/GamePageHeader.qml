import QtQuick 2.0
import Sailfish.Silica 1.0

Label {

    anchors.right: parent.right
    anchors.rightMargin: Theme.paddingLarge
    anchors.topMargin: Theme.paddingLarge
    anchors.left: parent.left
    anchors.leftMargin: 120
    horizontalAlignment:Text.AlignRight

    font.pixelSize: Theme.fontSizeLarge
    font.family: fontFamilySetting
    color: Theme.highlightColor
    wrapMode: Text.WordWrap


}
