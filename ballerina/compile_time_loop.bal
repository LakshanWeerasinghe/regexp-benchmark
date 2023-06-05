import ballerina/io;
import ballerina/time;

isolated function calculate1(string text) returns decimal {
    time:Utc 'start = time:utcNow();
    string:RegExp regexpPattern = re `[a-z]`;
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
}
