function prettifyNumber(number) {
    var numberString = number.toString();
    var prettyNumber = "";
    var numbBlock=0;
    for (var i=numberString.length-1; i >= 0; i--){
         prettyNumber = numberString[i] + prettyNumber;
         numbBlock++;
        if(numbBlock==3 && i !=0) {
            prettyNumber = " " + prettyNumber;
            numbBlock=0;
        }
    }
    return prettyNumber;
}
