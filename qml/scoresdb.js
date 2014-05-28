.import QtQuick.LocalStorage 2.0 as LS

var CREATE_SCORES = "CREATE TABLE IF NOT EXISTS Scores(name TEXT, score NUMBER, gamemode TEXT, difficulty NUMBER)";

function getDatabase() {
    return LS.LocalStorage.openDatabaseSync("SailCountries", "1.0", "StorageDatabase", 100000);
}

function saveHighScore(name, score, gamemode, difficulty) {
    var dataStr = "INSERT INTO Scores VALUES(?, ?, ?, ?)";
    var data = [name, score, gamemode, difficulty];
    var db = getDatabase();
    db.transaction(function(tx) {
        tx.executeSql(CREATE_SCORES);
        tx.executeSql(dataStr, data);


    });
}

function getHighScoreList(gamemode, difficulty) {
    var db = getDatabase();
    var r = ""
    db.transaction(function(tx) {
        tx.executeSql(CREATE_SCORES);

        var rs = tx.executeSql('SELECT * FROM Scores WHERE gamemode = "' + gamemode + '" AND difficulty = ' + difficulty + ' ORDER BY score desc LIMIT 3');

        for (var i = 0; i < rs.rows.length; i++) {
            r += "    " + (i + 1) + ". " + rs.rows.item(i).name + ': ' + rs.rows.item(i).score + '\n';
        }

    });
    return r;
}
