using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

public class MainClass
{
    public static double Calculate(string pattern, string text)
    {
        DateTime start = DateTime.Now;
        Regex regexPattern = new Regex(pattern);
        MatchCollection matches = regexPattern.Matches(text);
        TimeSpan elapsed = DateTime.Now - start;
        return elapsed.TotalMilliseconds;
    }

    public static void Main(string[] args)
    {
        string inputTxtPath = args[0];
        string patternsPath = args[1];
        string resultPath = args[2];

        Console.WriteLine("Args - inputTxtPath: " + inputTxtPath + ", patternsPath: " + patternsPath + ", resultPath: " + resultPath);

        if (string.IsNullOrEmpty(inputTxtPath) || string.IsNullOrEmpty(patternsPath) || string.IsNullOrEmpty(resultPath))
        {
            Console.WriteLine("Usage: dotnet run -- <inputTxtPath> <patternsPath> <resultPath>");
            return;
        }

        string inputTxt = File.ReadAllText(inputTxtPath);
        string[] patternsInput = File.ReadAllLines(patternsPath);

        List<string> results = new List<string>();
        foreach (string pattern in patternsInput)
        {
            double avgTime = 0.0;
            for (int i = 0; i < 10; i++)
            {
                double exe = Calculate(pattern, inputTxt);
                avgTime += exe;
            }
            results.Add(pattern + "\t\t" + avgTime);
        }

        File.WriteAllLines(resultPath, results);
    }
}
