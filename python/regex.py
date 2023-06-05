import sys
import re
import time

def calculate(pattern, text):
    start = time.time()
    regexPattern = re.compile(pattern)
    regexPattern.findall(text)
    end = time.time()
    elapsed = end - start
    return elapsed * 1000

def main():
    inputTxtPath = sys.argv[1]
    patternsPath = sys.argv[2]
    resultPath = sys.argv[3]

    print("Args - inputTxtPath:", inputTxtPath, "patternsPath:", patternsPath, "resultPath:", resultPath)

    if inputTxtPath == "" or patternsPath == "" or resultPath == "":
        print("Usage: python main.py inputTxtPath patternsPath resultPath")
        return

    with open(inputTxtPath, "r") as inputTxtFile:
        inputTxt = inputTxtFile.read()

    with open(patternsPath, "r") as patternsFile:
        patternsInput = patternsFile.readlines()

    results = []
    for pattern in patternsInput:
        avgTime = 0.0
        for i in range(10):
            exe = calculate(pattern.strip(), inputTxt)
            avgTime += exe
        avgTime /= 10    
        results.append(pattern.strip() + "\t\t" + str(avgTime))

    with open(resultPath, "w") as resultFile:
        resultFile.write("\n".join(results))

if __name__ == "__main__":
    main()
