#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include <QtGui/QGuiApplication>
#include <QQmlContext>
#include <QQuickView>
#include <QTranslator>

int main(int argc, char *argv[])
{
    QGuiApplication* app = SailfishApp::application(argc, argv);
    QString translationPath(SailfishApp::pathTo("translations").toLocalFile());

    QTranslator engineeringEnglish;
    engineeringEnglish.load("sailcountries", translationPath);
    qApp->installTranslator(&engineeringEnglish);

    QTranslator translator;
    translator.load(QLocale(), "sailcountries", "_", translationPath);
    qApp->installTranslator(&translator);

    QScopedPointer <QQuickView> view(SailfishApp::createView());
    app->setApplicationName("harbour-sailcountries");
    app->setOrganizationDomain("harbour-sailcountries");
    app->setOrganizationName("harbour-sailcountries");

    view->setTitle("SailCountries");

    QUrl pageSource = SailfishApp::pathTo("qml/harbour-sailcountries.qml");
    view->setSource(pageSource);


    view->showFullScreen();

    return app->exec();
}

