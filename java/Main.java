import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    public static double calculate(String pattern, String text) {
        Instant start = Instant.now();
        Pattern regexPattern = Pattern.compile(pattern);
        Matcher matcher = regexPattern.matcher(text);
        while (matcher.find()) {
            // Perform any necessary actions on the matched text
        }
        Instant end = Instant.now();
        return (double) (end.toEpochMilli() - start.toEpochMilli());
    }

    public static void main(String[] args) {
        String inputTxtPath = args[0];
        String patternsPath = args[1];
        String resultPath = args[2];

        System.out.println("Args - inputTxtPath: " + inputTxtPath + ", patternsPath: " + patternsPath + ", resultPath: " + resultPath);

        if (inputTxtPath.isEmpty() || patternsPath.isEmpty() || resultPath.isEmpty()) {
            System.out.println("Usage: java Main filePath patternsPath resultPath");
            return;
        }

        try {
            List<String> patternsInput = Files.readAllLines(Paths.get(patternsPath));
            String inputTxt = new String(Files.readAllBytes(Paths.get(inputTxtPath)));

            List<String> results = new ArrayList<>();
            for (String pattern : patternsInput) {
                double avgTime = 0.0;
                for (int i = 0; i < 10; i++) {
                    double exe = calculate(pattern, inputTxt);
                    avgTime += exe;
                }
                avgTime /= 10;
                results.add(pattern + "\t\t" + avgTime);
            }
            Files.write(Paths.get(resultPath), results);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
