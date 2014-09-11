import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "cover"

import "game.js" as Game
import "settingsdb.js" as SettingsDb

ApplicationWindow
{

    property int fontFamilySettingIndex : parseInt(SettingsDb.get("font","1"))

    property string fontFamilySetting : fontFamilySettingIndex === 0 ? gameMenuFont.name : Theme.fontFamily
    initialPage: Component { StartPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")


    StartPage {
      id: startPage
    }
    GamePage {
      id: gamePage
    }
    StartGamePage {
      id: startGamePage
    }
    GameOverPage {
      id: gameOverPage
    }

    FontLoader { id: gameMenuFont; source: "fonts/peleja-regular-1.0.otf" }


}


