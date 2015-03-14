import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"
import "../countries.js" as Countries

Page {

    id: countryListPage

    GamePageHeader {
        id: header
        anchors.top: parent.top
        text: qsTr("Countries")
    }

    SilicaListView {
        anchors {
            top: header.bottom
            topMargin: Theme.paddingLarge
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        clip: true
        VerticalScrollDecorator {}
        model: countriesModel
       delegate:
           CountryListEntry {
            onClicked:pageStack.push(Qt.resolvedUrl("CountryDetailPage.qml"),{"country":model})
           }


    }
    ListModel {
        id: countriesModel
    }
    Component.onCompleted: {
        var countries = Countries.getCountriesData();
        countries.sort(function(country1, country2){
            if ( country1.name < country2.name )
              return -1;
            if ( country1.name > country2.name )
              return 1;
            return 0;
        });
        for (var i = 0; i < countries.length; i++) {
            countriesModel.append(countries[i])
        }
    }
}



