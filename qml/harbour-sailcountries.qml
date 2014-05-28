import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "cover"

import "game.js" as Game

ApplicationWindow
{
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


}


