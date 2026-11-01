import Foundation

/**
 * Reads integers from input.txt line by line, reports invalid lines,
 * and writes the total sum of all valid integers to output.txt.
 *
 * @author Sarah OUAMOU
 * @version 6.7
 * @since 2026-11-01
 */

// Define file paths in the current directory
let inputFilePath = "input.txt"
let outputFilePath = "output.txt"

do {
    // Read the contents of input.txt
    let inputData = try String(contentsOfFile: inputFilePath, encoding: .utf8)
    
    // Split the file contents by newline characters
    let lines = inputData.components(separatedBy: .newlines)
    
    var outputLines: [String] = []
    var totalSum = 0 

    for line in lines {
        // Trim leading and trailing whitespace/newlines
        let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)

        // Skip blank lines
        if trimmedLine.isEmpty {
            continue
        }

        // Split the line by spaces in case multiple values exist on a line
        let pieces = trimmedLine.components(separatedBy: .whitespaces)

        for piece in pieces {
            if let number = Int(piece) {
                // Add valid integers to the running total
                totalSum += number
            } else {
                // Collect error message for invalid integers
                outputLines.append("\(piece) is not a valid int")
            }
        }
    }

    // Append the final sum at the end of the results
    outputLines.append("\(totalSum)")

    // Join all output lines with newline characters
    let outputContent = outputLines.joined(separator: "\n") + "\n"

    // Write the results to output.txt
    try outputContent.write(toFile: outputFilePath, atomically: true, encoding: .utf8)

} catch {
    print("File error: \(error.localizedDescription)")
}
