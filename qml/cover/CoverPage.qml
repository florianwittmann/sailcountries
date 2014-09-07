import QtQuick 2.0
import Sailfish.Silica 1.0
import "../game.js" as Game
import "../components"

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


    spacing: 6
    GameLabel {
        id: coverLabel
        text: "SailCountries"
        horizontalAlignment:Text.AlignHCenter
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.highlightColor

    }

    Image {
        id: countryImage
        source: ""
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingMedium
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingMedium
        opacity: 0.6
    }

    GameLabel {
        id: countryName
        font.pixelSize: Theme.fontSizeSmall
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment:Text.AlignHCenter
        color: Theme.primaryColor



    }
}


CoverActionList {
    id: coverAction

    CoverAction {
        iconSource: "image://theme/icon-cover-next"
        onTriggered : setNextFeaturedCountry()

    }

}



}



