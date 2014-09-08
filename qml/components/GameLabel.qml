import QtQuick 2.0
import Sailfish.Silica 1.0

Label {
    anchors.right: parent.right
    anchors.rightMargin: Theme.paddingLarge
    anchors.left: parent.left
    anchors.leftMargin: Theme.paddingLarge
    font.pixelSize: Theme.fontSizeMedium
    font.family: fontFamilySetting
    color: Theme.secondaryHighlightColor
    wrapMode: Text.WordWrap
}
