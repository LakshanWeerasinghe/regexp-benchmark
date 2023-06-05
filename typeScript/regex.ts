import * as fs from 'fs';

function calculate(pattern: string, text: string): number {
    const start = Date.now();
    const regexPattern = new RegExp(pattern);
    text.match(regexPattern);
    const end = Date.now();
    return end - start;
}

function main() {
    const inputTxtPath = process.argv[2];
    const patternsPath = process.argv[3];
    const resultPath = process.argv[4];

    console.log(`Args - inputTxtPath: ${inputTxtPath}, patternsPath: ${patternsPath}, resultPath: ${resultPath}`);

    if (!inputTxtPath || !patternsPath || !resultPath) {
        console.log('Usage: ts-node main.ts inputTxtPath patternsPath resultPath');
        return;
    }

    const inputTxt = fs.readFileSync(inputTxtPath, 'utf-8');
    const patternsInput = fs.readFileSync(patternsPath, 'utf-8').split('\n');

    const results: string[] = [];
    for (const pattern of patternsInput) {
        let avgTime = 0;
        for (let i = 0; i < 10; i++) {
            const exe = calculate(pattern.trim(), inputTxt);
            avgTime += exe;
        }
        results.push(`${pattern}\t\t${avgTime}`);
    }

    fs.writeFileSync(resultPath, results.join('\n'));
}

main();
