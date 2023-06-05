package main

import (
	"fmt"
	"io/ioutil"
	"bytes"
    "log"
    "os"
    "regexp"
    "time"
	"strings"
)

func calculate(pattern, text string) float64 {
	start := time.Now()
	regexPattern, err := regexp.Compile(pattern)
	if err != nil {
		panic(err)
	}
	regexPattern.FindAllString(text, -1)
	end := time.Now()
	elapsed := end.Sub(start)
	return float64(elapsed) / float64(time.Millisecond)
}

func main() {
	inputTxtPath := os.Args[1]
	patternsPath := os.Args[2]
	resultPath := os.Args[3]

	fmt.Printf("Args - inputTxtPath: %s, patternsPath: %s, resultPath: %s\n", inputTxtPath, patternsPath, resultPath)

	if inputTxtPath == "" || patternsPath == "" || resultPath == "" {
		fmt.Println("Usage: go run main.go inputTxtPath patternsPath resultPath")
		return
	}

	inputFileRC, err := os.Open(inputTxtPath)
    if err != nil {
        log.Fatal(err)
    }
    defer inputFileRC.Close()

    inputBuf := new(bytes.Buffer)
    inputBuf.ReadFrom(inputFileRC)
    inputTxt := inputBuf.String()
	
	patternsFileRC, err := os.Open(patternsPath)
    if err != nil {
        log.Fatal(err)
    }
    defer patternsFileRC.Close()

    patternsBuff := new(bytes.Buffer)
    patternsBuff.ReadFrom(patternsFileRC)
	patternsInput := strings.Split(patternsBuff.String(), "\n")

	var results []string
	for _, pattern := range patternsInput {
		avgTime := 0.0
		for i := 0; i < 10; i++ {
			exe := calculate(pattern, inputTxt)
			avgTime += exe
		}
		avgTime /= 10
		results = append(results, fmt.Sprintf("%s\t\t%.4f", pattern, avgTime))
	}

	resultString := strings.Join(results, "\n")
	err = ioutil.WriteFile(resultPath, []byte(resultString), 0644)
	if err != nil {
		fmt.Println(err)
		return
	}
}
