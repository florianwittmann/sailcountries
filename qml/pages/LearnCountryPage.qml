import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

import "../game.js" as Game
import "../helper.js" as Helper

import "../scoresdb.js" as ScoresDB


Page {
    id: learnCountryPage
    property var country : getNextFeaturedCountry()
    property int learnMode : 0
    property string learnModeTitle : ""

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Stop learning")
                onClicked: {
                    pageStack.replace(Qt.resolvedUrl("StartPage.qml"))
                }
            }
        }

        GamePageHeader {
            id: header
            text: learnModeTitle
        }


        Column {
            spacing : 10
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width

            GameLabel {
                horizontalAlignment:Text.AlignHCenter
                font.pixelSize: Theme.fontSizeExtraLarge
                color: Theme.primaryColor
                text: country.name
            }

            Image {
                visible: learnMode === 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                anchors.leftMargin: Theme.paddingLarge

                source:"../../data/flags/" + country.code.toLowerCase() +".png";
                fillMode: Image.PreserveAspectFit
            }

             GameLabel {
                 horizontalAlignment:Text.AlignHCenter
                 visible: learnMode === 0
                 font.pixelSize: Theme.fontSizeExtraLarge
                 text: country.capital
                 color: Theme.highlightColor

             }

             GameLabel {
                 horizontalAlignment:Text.AlignHCenter
                 visible: learnMode === 2
                 font.pixelSize: Theme.fontSizeExtraLarge
                 text:  Helper.prettifyNumber(country.population)
                 color: Theme.highlightColor

             }

             GameLabel {
                 horizontalAlignment:Text.AlignHCenter
                 visible: learnMode === 3
                 font.pixelSize: Theme.fontSizeExtraLarge
                 text: Helper.prettifyNumber(country.area) + " km²"
                 color: Theme.highlightColor

             }

        }

        MouseArea {
            onClicked: country = getNextFeaturedCountry()
            anchors.fill: parent
        }
    }



    FontLoader { id: gameMenuFont; source: "../fonts/peleja-regular-1.0.otf" }

    function getNextFeaturedCountry() {
        Game.getNextFeaturedCountry();
        return Game.getCurrentFeaturedCountry();
    }
}





