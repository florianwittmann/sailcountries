import QtQuick 2.0
import Sailfish.Silica 1.0

Label {
    anchors.right: parent.right
    anchors.rightMargin: Theme.paddingLarge
    anchors.left: parent.left
    anchors.leftMargin: Theme.paddingLarge
    font.pixelSize: Theme.fontSizeMedium
    font.family: gameMenuFont.name
    color: Theme.secondaryHighlightColor
    FontLoader { id: gameMenuFont; source: "../fonts/peleja-regular-1.0.otf" }
    wrapMode: Text.WordWrap
}
