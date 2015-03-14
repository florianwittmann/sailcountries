# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-sailcountries

data.files = data
data.path = /usr/share/$${TARGET}

qm_files.files = translations
qm_files.path = /usr/share/$$TARGET

INSTALLS += data qm_files

CONFIG += sailfishapp

SOURCES += src/harbour-sailcountries.cpp

OTHER_FILES += qml/harbour-sailcountries.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-sailcountries.spec \
    rpm/harbour-sailcountries.yaml \
    translations/* \
    harbour-sailcountries.desktop \
    qml/game.js \
    qml/countries.js \
    qml/pages/GamePage.qml \
    qml/pages/StartPage.qml \
    qml/pages/StartGamePage.qml \
    qml/pages/GameOverPage.qml \
    LICENSE \
    Changelog \
    qml/pages/ScoresPage.qml \
    qml/questions.js \
    qml/gamemodes.js \
    qml/difficulties.js \
    qml/helper.js \
    qml/scoresdb.js \
    qml/enums.js \
    qml/pages/AboutPage.qml \
    qml/images/sailcountries_logo.png \
    qml/components/GameMenuButton.qml \
    qml/fonts/peleja-regular-1.0.otf \
    qml/components/AnswerButton.qml \
    qml/components/SettingsChooser.qml \
    qml/components/GamePageHeader.qml \
    qml/components/GameSectionHeader.qml \
    qml/components/GameLabel.qml \
    qml/components/CountryListEntry.qml \
    qml/pages/CountryDetailPage.qml \
    qml/learnmodes.js \
    qml/pages/CountriesListPage.qml \
    qml/pages/LearnCountryPage.qml \
    qml/pages/StartLearningPage.qml \
    qml/settingsdb.js \
    qml/pages/SettingsPage.qml \
    qml/settings.js \
    qml/pages/FreestylePage.qml

HEADERS +=

QT += sql


lupdate_only {
SOURCES = qml/harbour-sailcountries.qml \
          qml/pages/*.qml \
          qml/cover/*.qml \
          qml/*.js
}

RESOURCES +=

TRANSLATIONS = translations/sailcountries_en.ts

