import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    id: aboutPage

    SilicaFlickable {
        anchors.fill: parent
        VerticalScrollDecorator {}

        contentHeight: headerColumn.height + contentColumn.height + Theme.paddingLarge

        Column {

          anchors {
              left: parent.left;
              right: parent.right;
          }

          id: headerColumn

          PageHeader {
              title: qsTr("About")
          }
        }

        Column {

            id: contentColumn
            spacing: 4

            anchors {
              top: headerColumn.bottom;
              topMargin: Theme.paddingMedium;
              left: parent.left;
              leftMargin: Theme.paddingLarge;
              right: parent.right;
              rightMargin: Theme.paddingLarge;
            }

            Label {
              color: Theme.highlightColor
              font.bold: true
              text : "SailCountries " + versionString
              font.pixelSize: Theme.fontSizeExtraLarge
            }

            Label {
              color: Theme.secondaryHighlightColor
              text : qsTr("A quiz game about the countries of the world.")
              width: parent.width
              wrapMode: Text.WordWrap

            }

            SectionHeader {
              text: qsTr("License")
            }


            Label {
              color: Theme.secondaryHighlightColor
              text : qsTr("Source code is licensed under the MIT License (MIT).")
              width: parent.width
              wrapMode: Text.WordWrap
            }

            SectionHeader {
              text: qsTr("Contribute")
            }

            Row {
              width: parent.width - Theme.paddingLarge

              Button {
                  width: parent.width/2
                  text: qsTr("Translate")
                  onClicked: Qt.openUrlExternally("https://www.transifex.com/projects/p/sailcountries/")
              }

              Button {
                  width: parent.width/2
                  text: qsTr("Report bugs")
                  onClicked: Qt.openUrlExternally("https://github.com/florianwittmann/sailcountries/issues")
              }
            }

            SectionHeader {
              text: qsTr("Donate")
            }

            Label {
              color: Theme.secondaryHighlightColor
              text : qsTr("If you enjoy the game, consider to buy me some beer :-)")
              width: parent.width
              wrapMode: Text.WordWrap
            }

            Row
            {
              width: parent.width - Theme.paddingLarge

              Button {
                  width: parent.width/2
                  text: qsTr("Paypal EUR")
                  onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=pp%40florianwittmann%2ede&item_name=SailCountries&no_note=0&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest")
              }

              Button {
                  width: parent.width/2
                  text: qsTr("Paypal USD")
                  onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=pp%40florianwittmann%2ede&item_name=SailCountries&no_note=0&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest")
              }
            }


            SectionHeader {
              text: qsTr("Thanks")
            }

            Label {
              color: Theme.secondaryHighlightColor
              text : qsTr("Many thanks to the translators for the help and your comments and likes on both openrepos and the jolla store.")
              width: parent.width
              wrapMode: Text.WordWrap

            }



        }
    }
}



