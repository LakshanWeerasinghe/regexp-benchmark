import ballerina/io;
import ballerina/time;

isolated function calculate1(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[a-z]`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate2(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[A-Za-z]`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate3(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[0-9]`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate4(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[A-Fa-f0-9]`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate5(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[0-9]+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate6(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `\d+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate7(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[a-z]+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate8(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[A-Za-z]+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate9(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `\w+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate10(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(abc|def)`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate11(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(?:abc|def)`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate12(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(abc|def)+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate13(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(?:abc|def)+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate14(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(abc|def){2,5}`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate15(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(?:abc|def){2,5}`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate16(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(ab|cd|ef|gh|ij|kl|mn|op|qr|st)+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate17(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(?:ab|cd|ef|gh|ij|kl|mn|op|qr|st)+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate18(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `([0-9]+)-([a-z]+)`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate19(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(\d+)-(\w+)`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate20(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `([0-9]{2,4})`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate21(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[a-zA-Z]+\d+`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate22(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(?:abc|def){2,5}[0-9]`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate23(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(?:ab|cd|ef|gh|ij|kl|mn|op|qr|st){2,5}`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate24(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `\d{3}-\d{3}-\d{4}`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

isolated function calculate25(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `(abc|def|ghi|jkl|mno|pqr|stu){2,5}`;
    _ = regexpPattern.findAll(text);
    time:Utc end = time:utcNow();
    return time:utcDiffSeconds('start, end) * 1000;
}

public function main(string? inputTxtPath, string? patternsPath, string? resultPath) returns error? {

    io:println(string `Args - inputTxtPath: ${inputTxtPath.toString()} 
                patternsPath ${patternsPath.toString()} resultPath ${resultPath.toString()}`);

    if inputTxtPath == () || patternsPath == () || resultPath == () {
        io:println("Usage: bal run ballerina/from_string.bal -- filePath patternsPath resultPath");
        return;
    }

    string inputTxt = check io:fileReadString(inputTxtPath);

    decimal exeTime1 = calculate1(inputTxt);
    check io:fileWriteLines(resultPath, [string `[a-z]       ${exeTime1}`], io:APPEND);

    decimal exeTime2 = calculate2(inputTxt);
    check io:fileWriteLines(resultPath, [string `[A-Za-z]    ${exeTime2}`], io:APPEND);

    decimal exeTime3 = calculate3(inputTxt);
    check io:fileWriteLines(resultPath, [string `[0-9]       ${exeTime3}`], io:APPEND);

    decimal exeTime4 = calculate4(inputTxt);
    check io:fileWriteLines(resultPath, [string `[A-Fa-f0-9] ${exeTime4}`], io:APPEND);

    decimal exeTime5 = calculate5(inputTxt);
    check io:fileWriteLines(resultPath, [string `[0-9]+      ${exeTime5}`], io:APPEND);

    decimal exeTime6 = calculate6(inputTxt);
    check io:fileWriteLines(resultPath, [string `\\d+         ${exeTime6}`], io:APPEND);

    decimal exeTime7 = calculate7(inputTxt);
    check io:fileWriteLines(resultPath, [string `[a-z]+   ${exeTime7}`], io:APPEND);

    decimal exeTime8 = calculate8(inputTxt);
    check io:fileWriteLines(resultPath, [string `[A-Za-z]+   ${exeTime8}`], io:APPEND);

    decimal exeTime9 = calculate9(inputTxt);
    check io:fileWriteLines(resultPath, [string `\\w+      ${exeTime9}`], io:APPEND);

    decimal exeTime10 = calculate10(inputTxt);
    check io:fileWriteLines(resultPath, [string `(abc|def)      ${exeTime10}`], io:APPEND);

    decimal exeTime11 = calculate11(inputTxt);
    check io:fileWriteLines(resultPath, [string `(?:abc|def)   ${exeTime11}`], io:APPEND);

    decimal exeTime12 = calculate12(inputTxt);
    check io:fileWriteLines(resultPath, [string `(abc|def)+      ${exeTime12}`], io:APPEND);

    decimal exeTime13 = calculate13(inputTxt);
    check io:fileWriteLines(resultPath, [string `(?:abc|def)+      ${exeTime13}`], io:APPEND);

    decimal exeTime14 = calculate14(inputTxt);
    check io:fileWriteLines(resultPath, [string `(abc|def){2,5}   ${exeTime14}`], io:APPEND);

    decimal exeTime15 = calculate15(inputTxt);  
    check io:fileWriteLines(resultPath, [string `(?:abc|def){2,5}   ${exeTime15}`], io:APPEND);

    decimal exeTime16 = calculate16(inputTxt);
    check io:fileWriteLines(resultPath, [string `(ab|cd|ef|gh|ij|kl|mn|op|qr|st)+   ${exeTime16}`], io:APPEND);

    decimal exeTime17 = calculate17(inputTxt);
    check io:fileWriteLines(resultPath, [string `(?:ab|cd|ef|gh|ij|kl|mn|op|qr|st)+   ${exeTime17}`], io:APPEND);

    decimal exeTime18 = calculate18(inputTxt);
    check io:fileWriteLines(resultPath, [string `([0-9]+)-([a-z]+)   ${exeTime18}`], io:APPEND);

    decimal exeTime19 = calculate19(inputTxt);
    check io:fileWriteLines(resultPath, [string `(\\d+)-(\\w+)   ${exeTime19}`], io:APPEND);

    decimal exeTime20 = calculate20(inputTxt);
    check io:fileWriteLines(resultPath, [string `([0-9]{2,4})   ${exeTime20}`], io:APPEND);

    decimal exeTime21 = calculate21(inputTxt);
    check io:fileWriteLines(resultPath, [string `[a-zA-Z]+\\d+   ${exeTime21}`], io:APPEND);

    decimal exeTime22 = calculate22(inputTxt);
    check io:fileWriteLines(resultPath, [string `(?:abc|def){2,5}[0-9]  ${exeTime22}`], io:APPEND);

    decimal exeTime23 = calculate23(inputTxt);
    check io:fileWriteLines(resultPath, [string `(?:ab|cd|ef|gh|ij|kl|mn|op|qr|st){2,5}   ${exeTime23}`], io:APPEND);

    decimal exeTime24 = calculate24(inputTxt);
    check io:fileWriteLines(resultPath, [string `\\d{3}-\\d{3}-\\d{4}   ${exeTime24}`], io:APPEND);

    decimal exeTime25 = calculate25(inputTxt);
    check io:fileWriteLines(resultPath, [string `(abc|def|ghi|jkl|mno|pqr|stu){2,5}   ${exeTime25}`], io:APPEND);
}
