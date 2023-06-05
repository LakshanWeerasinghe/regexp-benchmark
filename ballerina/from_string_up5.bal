import ballerina/lang.regexp;
import ballerina/io;
import ballerina/time;

isolated function calculate(string pattern, string text) returns decimal|error {
    time:Utc 'start = time:utcNow();
    string:RegExp|error regexpPattern = trap regexp:fromString(pattern);
    if regexpPattern is error {
        return -1;
    }
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

    string[] patternsInput = check io:fileReadLines(patternsPath);
    string inputTxt = check io:fileReadString(inputTxtPath);

    foreach var pattern in patternsInput {
        decimal exeTime = 0.0;
        foreach int i in 0...9 {
            decimal|error exe = calculate(pattern, inputTxt);
            if exe is error {
                io:println(exe);
                return;
            }
            exeTime += exe;
        }
        decimal avgTime = exeTime / 10;
        check io:fileWriteLines(resultPath, [string `${pattern}        ${avgTime}`], io:APPEND);
    }
}
