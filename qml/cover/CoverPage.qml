import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game

CoverBackground {

    property bool active: status == Cover.Active

    property var setFeaturedCountry : function() {
        var country = Game.getCurrentFeaturedCountry();
        countryImage.source = "../../data/flags/" + country.code.toLowerCase() +".png";
        countryName.text = country.name;
    }

    property var setNextFeaturedCountry : function() {
        Game.getNextFeaturedCountry();
        setFeaturedCountry();
    }

    onActiveChanged : setFeaturedCountry()


Column {

    anchors.topMargin: Theme.paddingMedium
    anchors.top: parent.top

    anchors.left: parent.left
    anchors.leftMargin: Theme.paddingMedium
    anchors.right: parent.right
    anchors.rightMargin: Theme.paddingMedium

    anchors.bottom: parent.bottom
    anchors.bottomMargin: Theme.paddingMedium


    spacing: 4
    Label {
        id: coverLabel
        text: "SailCountries"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: countryImage
        source: ""
        fillMode: Image.PreserveAspectFit
        width: parent.width
        opacity: 0.6
    }

    Label {
        id: countryName
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: Theme.fontSizeSmall
    }
}




}



