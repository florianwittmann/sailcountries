import QtQuick 2.0
import Sailfish.Silica 1.0


Item {
    id: root
    signal clicked
    property string title : ""
    property string choosedSetting : ""
    property int currentIndex : -1


    height: settingsTitelLabel.height + (choosedSettingLabel.text !== "" ? choosedSettingLabel.height : 0) + Theme.paddingSmall
    width: parent.width

    Label {
        id: settingsTitelLabel
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingMedium
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingMedium
        wrapMode: Text.WordWrap
        color: Theme.highlightColor
        text: title
        font.family: gameMenuFont.name
        font.pixelSize: Theme.fontSizeLarge
        horizontalAlignment:Text.AlignHCenter
    }
    Label {
        id: choosedSettingLabel
        anchors.top: settingsTitelLabel.bottom
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingMedium
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingMedium
        wrapMode: Text.WordWrap
        color: Theme.primaryColor
        font.family: gameMenuFont.name
        font.pixelSize: Theme.fontSizeMedium
        horizontalAlignment:Text.AlignHCenter
        text: choosedSetting

    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }

    FontLoader { id: gameMenuFont; source: "../fonts/peleja-regular-1.0.otf" }

}
