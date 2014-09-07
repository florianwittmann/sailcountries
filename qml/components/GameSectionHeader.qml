import QtQuick 2.0
import Sailfish.Silica 1.0

Label {
    height: Theme.itemSizeSmall
    verticalAlignment:Text.AlignBottom
    anchors.right: parent.right
    anchors.rightMargin: Theme.paddingLarge
    font.pixelSize: Theme.fontSizeSmall
    font.family: gameMenuFont.name
    color: Theme.highlightColor
    FontLoader { id: gameMenuFont; source: "../fonts/peleja-regular-1.0.otf" }
}
