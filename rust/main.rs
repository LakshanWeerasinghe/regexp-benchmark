use std::env;
use std::fs;
use std::io::{self, Write};
use std::time::{Instant, Duration};
use regex::Regex;

fn calculate(pattern: &str, text: &str) -> Duration {
    let start = Instant::now();
    let regex_pattern = Regex::new(pattern).unwrap();
    regex_pattern.find_iter(text).count();
    Instant::now() - start
}

fn main() -> io::Result<()> {
    let args: Vec<String> = env::args().collect();
    let input_txt_path = &args[1];
    let patterns_path = &args[2];
    let result_path = &args[3];

    println!("Args - inputTxtPath: {}, patternsPath: {}, resultPath: {}", input_txt_path, patterns_path, result_path);

    if input_txt_path.is_empty() || patterns_path.is_empty() || result_path.is_empty() {
        writeln!(io::stderr(), "Usage: cargo run -- <inputTxtPath> <patternsPath> <resultPath>")?;
        return Ok(());
    }

    let input_txt = fs::read_to_string(input_txt_path)?;
    let patterns_input = fs::read_to_string(patterns_path)?;

    let mut results = Vec::new();
    for pattern in patterns_input.lines() {
        let mut avg_time = Duration::new(0, 0);
        for _ in 0..10 {
            let exe = calculate(pattern, &input_txt);
            avg_time += exe;
        }
        let avg_time_secs = avg_time.as_secs_f64();
        results.push(format!("{}\t\t{:.4}", pattern, avg_time_secs));
    }

    let result_string = results.join("\n");
    fs::write(result_path, result_string)?;

    Ok(())
}
