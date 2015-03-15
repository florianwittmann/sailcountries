Qt.include("helper.js");

var Questions = (function () {

    function getQuestion(answerCount, randomCountries, categories) {
        var questionFuncs = [];
        categories.forEach(function(category) {
            switch(category) {
                case 0:
                    questionFuncs.push(askForCapitalCity);
                    questionFuncs.push(askForCountryName);
                    break;
               case 1:
                   questionFuncs.push(askForFlagOfCountry);
                   questionFuncs.push(askForCountryOfFlag);
                   break;
               case 2:
                   questionFuncs.push(selectTheBiggestPopulation);
                   questionFuncs.push(selectTheSmallestPopulation);
                   break;
               case 3:
                   questionFuncs.push(selectTheBiggestCountry);
                   questionFuncs.push(selectTheSmallestCountry);
                   break;
            }
        });
        var randomnumber=Math.floor(Math.random()*(questionFuncs.length));
        return questionFuncs[randomnumber](answerCount, randomCountries);
    }

    function askForCapitalCity(answerCount, randomCountries) {
        var searchedAnswer=Math.floor(Math.random()*answerCount);

        var question =  {
            ask: qsTr("What is the capital city of %1?").arg(randomCountries[searchedAnswer].name),
            answers:    new Array(answerCount),
            answerDetails:    new Array(answerCount),
            correct: searchedAnswer,
            type: 0,
            questiontype: 0
        }

        for(var i=0; i<answerCount; i++) {
            question.answers[i] = randomCountries[i].capital;
            question.answerDetails[i] = randomCountries[i].name;
        }
        return question;
    }

    function selectTheBiggestCountry(answerCount, randomCountries) {

        var question =  {
            ask: qsTr("Select the biggest country: "),
            answers:    new Array(answerCount),
            answerDetails:    new Array(answerCount),
            type: 0,
            questiontype: 0


        };

        var size = 0;
        var currentCorrect = 0;

        for(var i=0; i<answerCount; i++) {

            if(randomCountries[i].area > size) {
                size = randomCountries[i].area;
                currentCorrect = i;
            }
            question.answers[i] = randomCountries[i].name;
            question.answerDetails[i] = prettifyNumber(randomCountries[i].area) + ' km\u00B2';
        }
        question.correct = currentCorrect;
        return question;
    }

    function selectTheSmallestCountry(answerCount, randomCountries) {

        var question =  {
            ask: qsTr("Select the smallest country: "),
            answers:    new Array(answerCount),
            answerDetails:    new Array(answerCount),
            type: 0,
            questiontype: 0
        };

        var size=-1;
        var currentCorrect = 0;

        for(var i=0; i<answerCount; i++) {


            if(randomCountries[i].area < size || size===-1) {
                size = randomCountries[i].area;
                currentCorrect = i;
            }

            question.answers[i] = randomCountries[i].name;
            question.answerDetails[i] = prettifyNumber(randomCountries[i].area) + ' km\u00B2';
        }
        question.correct = currentCorrect;
        return question;
    }


    function askForCountryName(answerCount, randomCountries) {
        var searchedAnswer=Math.floor(Math.random()*answerCount);


        var question =  {
            ask: qsTr("%1 is the capital of?").arg(randomCountries[searchedAnswer].capital),
            answers:    new Array(answerCount),
            answerDetails:    new Array(answerCount),
            correct: searchedAnswer,
            type: 0,
            questiontype: 0
        }

        for(var i=0; i<answerCount; i++) {
            question.answers[i] = randomCountries[i].name;
            question.answerDetails[i] = randomCountries[i].capital;

        }
        return question;
    }

    function askForFlagOfCountry(answerCount, randomCountries) {
        var searchedAnswer=Math.floor(Math.random()*answerCount);

        var question =  {
            ask: qsTr("What is the flag of %1?").arg(randomCountries[searchedAnswer].name),
            answers:    new Array(answerCount),
            answerDetails:    new Array(answerCount),
            correct: searchedAnswer,
            type: 1,
            questiontype: 0
        }

        for(var i=0; i<answerCount; i++) {
            question.answers[i] = "../../data/flags/" + randomCountries[i].code.toLowerCase() +".png";
            question.answerDetails[i] = randomCountries[i].name;
        }
        return question;
    }

    function askForCountryOfFlag(answerCount, randomCountries) {
        var searchedAnswer=Math.floor(Math.random()*answerCount);

        var question =  {
            ask: qsTr("Which country has this flag?"),
            answerDetails:    new Array(answerCount),
            image: "../../data/flags/" + randomCountries[searchedAnswer].code.toLowerCase() +".png",
            answers:    new Array(answerCount),
            correct: searchedAnswer,
            type: 0,
            questiontype: 1
        }

        for(var i=0; i<answerCount; i++) {
            question.answers[i] =  randomCountries[i].name;
            question.answerDetails[i] = "../../data/flags/" + randomCountries[i].code.toLowerCase() +".png";

        }
        return question;
    }

    function selectTheBiggestPopulation(answerCount, randomCountries) {

        var question =  {
            ask: qsTr("Select the country with the biggest population:"),
            answers:    new Array(answerCount),
            answerDetails:    new Array(answerCount),
            type: 0,
            questiontype: 0


        }

        var size=0;
        var currentCorrect = 0;

        for(var i=0; i<answerCount; i++) {

            if(randomCountries[i].population > size) {
                size = randomCountries[i].population;
                currentCorrect = i;
            }
            question.answers[i] = randomCountries[i].name;
            question.answerDetails[i] = prettifyNumber(randomCountries[i].population);

        }
        question.correct = currentCorrect;
        return question;
    }


    function selectTheSmallestPopulation(answerCount, randomCountries) {

        var question =  {
            ask: qsTr("Select the country with the smallest population:"),
            answers:    new Array(answerCount),
            answerDetails:    new Array(answerCount),
            type: 0,
            questiontype: 0
        }

        var size=-1;
        var currentCorrect = 0;

        for(var i=0; i<answerCount; i++) {

            if(randomCountries[i].population < size || size===-1) {
                size = randomCountries[i].population;
                currentCorrect = i;
            }
            question.answers[i] = randomCountries[i].name;
            question.answerDetails[i] = prettifyNumber(randomCountries[i].population);

        }
        question.correct = currentCorrect;
        return question;
    }

    return {
        getQuestion: getQuestion,
        askForCountryOfFlag: askForCountryOfFlag,
        askForFlagOfCountry: askForFlagOfCountry,
        selectTheBiggestCountry: selectTheBiggestCountry,
        selectTheBiggestPopulation: selectTheBiggestPopulation,
        selectTheSmallestCountry: selectTheSmallestCountry,
        selectTheSmallestPopulation: selectTheSmallestPopulation,
        askForCapitalCity: askForCapitalCity,
        askForCountryName: askForCountryName
    };

})();




