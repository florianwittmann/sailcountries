import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game
import "../helper.js" as Helper

Page {

    id: welcomePage


    property var setFeaturedCountry:
        function () {
            var country = Game.getCurrentFeaturedCountry();
            countryName.text = country.name;
            countryImage.source = "../../data/flags/" + country.code.toLowerCase() +".png";
            capitalName.text = qsTr("capital") + ": " + country.capital
            countrySize.text = qsTr("size") + ": " + Helper.prettifyNumber(country.area) + " km²";
            countryPopulation.text = qsTr("population") + ": " + Helper.prettifyNumber(country.population);
        }
    property var setNextFeaturedCountry : function() {
        Game.getNextFeaturedCountry();
        setFeaturedCountry();
    }

    Component.onCompleted: setNextFeaturedCountry()


    SilicaFlickable {

        anchors.fill: parent
        contentHeight: header.height +  countryColumn.height + buttons.height


        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                }
            }
        }


        PageHeader {
            id: header
            title: "SailCountries"
        }

        Column {
            id: countryColumn

            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingLarge
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingLarge
            anchors.top: header.bottom
            anchors.topMargin: Theme.paddingLarge
            spacing: 2




            Image {
                id: countryImage
                source: ""
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: welcomePage.height/2.5
                MouseArea {
                    anchors.fill: parent
                    onClicked: setNextFeaturedCountry()
                }
            }

            Label {
                id: countryName
                color: Theme.highlightColor
                font.bold: true
                text : ""
            }


            Label {
                id: capitalName
                text : ""
            }


            Label {
                id: countrySize
                text : ""
            }

            Label {
                id: countryPopulation
                text : ""
            }


        }


        Column {

            id: buttons

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: countryColumn.bottom
            anchors.topMargin: Theme.paddingMedium

            Button {
               text: qsTr("Start new game")
               onClicked: pageStack.push(Qt.resolvedUrl("StartGamePage.qml"))

            }
            Button {
               text: qsTr("Highscores")
               onClicked: pageStack.push(Qt.resolvedUrl("ScoresPage.qml"))
            }

        }
    }

}



