import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {

    id: aboutPage

    SilicaFlickable {
        anchors.fill: parent
        VerticalScrollDecorator {}

        contentHeight: lastLabel.y + lastLabel.height + 150


        GamePageHeader {
            id: header
            text: qsTr("About")
        }

        Column {

            id: contentColumn
            spacing: 4

            anchors {
              top: header.bottom;
              topMargin: Theme.paddingMedium;
              left: parent.left;
              right: parent.right;
            }



            GameLabel {
              color: Theme.highlightColor
              text : "SailCountries " + versionString
              font.pixelSize: Theme.fontSizeLarge
            }

            GameLabel {
              text : qsTr("A quiz game about the countries of the world.")
            }

            GameSectionHeader {
              text: qsTr("License")
            }


            GameLabel {
              text : qsTr("Source code is licensed under the MIT License (MIT).")
            }
            GameLabel {
              text : qsTr("The font is licensed under the SIL Open Font License (OFL).")
            }

            GameSectionHeader {
              text: qsTr("Contribute")
            }

            Row {
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingLarge
                height: Theme.itemSizeMedium + Theme.paddingMedium


              GameMenuButton {
                  anchors.bottom: parent.bottom
                  fontSize: Theme.fontSizeMedium
                  width: parent.width/2
                  text: qsTr("Translate")
                  onClicked: Qt.openUrlExternally("https://www.transifex.com/projects/p/sailcountries/")
              }

              GameMenuButton {
                  anchors.bottom: parent.bottom
                  fontSize: Theme.fontSizeMedium
                  width: parent.width/2
                  text: qsTr("Report bugs")
                  onClicked: Qt.openUrlExternally("https://github.com/florianwittmann/sailcountries/issues")
              }
            }

            GameSectionHeader {
              text: qsTr("Donate")
            }

            GameLabel {
              text : qsTr("If you enjoy the game, consider to buy me some beer :-)")
            }

            Row
            {
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingLarge
                height:  Theme.itemSizeMedium + Theme.paddingMedium

              GameMenuButton {
                  anchors.bottom: parent.bottom
                  fontSize: Theme.fontSizeMedium
                  width: parent.width/2
                  text: qsTr("Paypal EUR")
                  onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=pp%40florianwittmann%2ede&item_name=SailCountries&no_note=0&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest")
              }

              GameMenuButton {
                  anchors.bottom: parent.bottom
                  fontSize: Theme.fontSizeMedium
                  width: parent.width/2
                  text: qsTr("Paypal USD")
                  onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=pp%40florianwittmann%2ede&item_name=SailCountries&no_note=0&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest")
              }
            }


            GameSectionHeader {
              text: qsTr("Thanks")
            }

            GameLabel {
              id: lastLabel
              text : qsTr("Many thanks to the translators for the help and your comments and likes on both openrepos and the jolla store.")
            }



        }
    }
}



