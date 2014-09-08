import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"
import "../game.js" as Game
import "../settings.js" as Settings
import "../settingsdb.js" as SettingsDb

Page {

    id: settingsPage

    property bool isChooseFontsVisible: true

    Column {
        id: countryColumn
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        Image {
            source: "../images/sailcountries_logo.png"
        }

        SettingsChooser {
            id: fontSettingsMode
            title: qsTr("Font")
            currentIndex: 0
            onClicked: {
                fontSettingsMode.choosedSetting = ""
                isChooseFontsVisible = true
            }
        }

        Repeater {
            model: fontSettings
            delegate: GameMenuButton {
                text: name
                visible: isChooseFontsVisible
                onClicked: {
                    fontSettingsMode.choosedSetting = name
                    fontSettingsMode.currentIndex = index
                    isChooseFontsVisible = false
                    SettingsDb.set("font",index)
                    fontFamilySettingIndex = index
                }
            }
        }
    }

    ListModel { id: fontSettings }

    Component.onCompleted: {
        for (var i = 0; i < Settings.fonts.length; i++) {
            fontSettings.append(Settings.fonts[i])
        }
    }

}
